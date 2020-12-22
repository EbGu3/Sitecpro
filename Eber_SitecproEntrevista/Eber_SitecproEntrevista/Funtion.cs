using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Eber_SitecproEntrevista.Models;

namespace Eber_SitecproEntrevista
{
    public class Funtion
    {
        //Pendiente Ejercicio 1
        public void ArraySide(ArraySegment<Array> array)
        {
           
        }

        //Listo Ejercicio 2
        public int MaxNumber(int[] array)
        {
            var numMax = 0;
            for (int i = 0; i < array.Length; i++)
            {
                if (numMax < array[i]) { numMax = array[i]; }
            }
            return numMax;
        }

        //Listo Ejercicio 3
        public Dictionary<string, int> CountWord(FileStream file)
        {
            var Words = new Dictionary<string, int>();
            var path = Path.GetFullPath(file.Name);

            using (StreamReader streamReader = new StreamReader(path))
            {
                var lineRead = streamReader.ReadLine();

                while (lineRead != null)
                {
                    var SplitLine = lineRead.Split(' ');
                    foreach (var item in SplitLine)
                    {
                        var rep = 0;
                        if (Words.TryGetValue(item, out rep))
                        {
                            Words[item] = rep + 1;
                        }
                        else
                        {
                            Words.Add(item, 1);
                        }
                    }
                    lineRead = streamReader.ReadLine();
                }
            }
            return Words;
        }

        public void GetMaxWord(Dictionary<string, int> Words)
        {
            var palabra = new Palabra();
            palabra.Texto = string.Empty;
            palabra.Repeticiones = 0;
            foreach (var item in Words)
            {
                if (palabra.Repeticiones < item.Value)
                {
                    palabra.Repeticiones = item.Value;
                    palabra.Texto = item.Key;
                }
            }
            Console.WriteLine($"La palabra más grande es: {palabra.Texto}, con un total de repeticiones de: {palabra.Repeticiones}");
        }

        //Listo Ejercicio 4
        public bool Palindome(string pharase)
        {
            var Wordbackwards = "";
            var pharaseSplit = pharase.Split(' ');
            var pharaseCompare = string.Empty;
            var Result = false;
            foreach (var item in pharaseSplit)
            {
                pharaseCompare += $"{item}";
            }

            for (int i = pharase.Length-1; i >= 0; i--)
            {
                if(pharase[i].ToString() != " ")
                {
                    Wordbackwards += pharase[i];
                }
            }
            if (pharaseCompare == Wordbackwards)
            {
                Result = true;
            }
            return Result;
        }

        //Listo Ejercicio 5
        //-1 significa que no esta asignado
        public int[] MaxArrayConsecutive(int[] array)
        {
            var ValueCompare = 0;
            var TotalValues = 0;
            int[] ArrayMaxConsecutive = new int[2] { -1, -1 };
            var CompareTotalValues = 0;
            int[] ArrayResult = new int[2];
            var contador = 0;
            var newList = array.ToList();
            newList.Sort();
            var newArray = newList.ToArray();
            Dictionary<int[], int> DictionaryArray = new Dictionary<int[], int>();

            for (int i = 0; i < newArray.Length - 1; i++)
            {
                ValueCompare = newArray[i] + 1;
                if(newArray[i+1] == ValueCompare)
                {
                   if(ArrayMaxConsecutive[0] == -1)
                   {
                        ArrayMaxConsecutive[0] = contador;
                        contador++;
                   }
                   else
                   {
                        contador++;
                        ArrayMaxConsecutive[1] = contador;
                   }
                }
                else
                {
                    contador++;
                    if (ArrayMaxConsecutive[0] == 0) { DictionaryArray.Add(ArrayMaxConsecutive, ArrayMaxConsecutive[1]);}
                    else
                    {
                        TotalValues = ( ArrayMaxConsecutive[1] - ArrayMaxConsecutive[0] ) + 1;
                        DictionaryArray.Add(ArrayMaxConsecutive, TotalValues);
                    }
                    ArrayMaxConsecutive = new int[2] { -1, -1 };

                }
            }

            if(ArrayMaxConsecutive[0] != -1 && ArrayMaxConsecutive[1] == -1 )
            {
                TotalValues = (ArrayMaxConsecutive[1] - ArrayMaxConsecutive[0]) + 1;
                DictionaryArray.Add(ArrayMaxConsecutive, TotalValues);
            }

            foreach (var item in DictionaryArray)
            {
                if(CompareTotalValues < item.Value)
                {
                    CompareTotalValues = item.Value;
                    ArrayResult = item.Key;
                }
            }

            return ArrayResult;
        }


    }
}
