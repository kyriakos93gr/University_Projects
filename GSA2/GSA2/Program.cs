using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace GSA2
{
    class GSA2
    {
        static void Main(string[] args)
        {
            gsa_algorithm();
        }

        static int f_index = 2;
        static int dimension = 30;
        static int N = 50;
        static int max_it = 1000;
        static int elitism = 1;
        static int min_flag = 1;
        static int Rpower = 1;
        static int iteration = 0;
        static double gravity_constant;
        static int low;
        static int high;
        

        static double[,] position = new double[N, dimension];
        static double[,] velocity = new double[N, dimension];
        static double[,] acceleration = new double[N, dimension];
        static double[,] force = new double[N, dimension];
        static double[,] euclid_distance = new double[N,N];
        static double[] mass = new double[N];
        static double[] fitness = new double[N];
        static double maxfit;
        static double minfit;

        static double[] best_per_iteration = new double[max_it];
        static double[] mean_per_iteration = new double[max_it];

        static void test_function_boundaries()
        {
            if (f_index == 1)
            {
                low = -100;
                high = 100;
            }
            else if (f_index == 2)
            {
                low = -10;
                high = 10;
            }
            else
            {
                throw new Exception("No f_index");
            }
        }

        static double test_function(double[] agent_position)
        {
            double fit = 0;
            if (f_index == 1)
            {
                for (int i = 0; i < agent_position.Length; i++)
                {
                    fit += Math.Pow(agent_position[i], 2);
                }
            }
            else if (f_index == 2)
            {
                double tmp_mull = 1;
                for (int i = 0; i < agent_position.Length; i++)
                {
                    fit += Math.Abs(agent_position[i]);
                    tmp_mull = tmp_mull * Math.Abs(agent_position[i]);
                }
                fit += tmp_mull;
            }
            if (double.IsNaN(fit) || double.IsInfinity(fit))
            {
                throw new ArithmeticException();
            }
            return fit;
        }
      
        static void initialise()
        {
            Random rdn = new Random();
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < dimension; j++)
                {
                    position[i, j] = rdn.NextDouble() * (high - low) + low;
                    velocity[i, j] = 0;
                }
            }
        }

        static void fitness_calculation()
        {
            double[] tmp_position = new double[dimension];
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < dimension; j++)
                {
                    // We get the position on all dimensions from one agent
                    tmp_position[j] = position [i, j];
                }
                // And we calculate the fitness
                fitness[i] = test_function(tmp_position);
            }
        }

        static void boundaries()
        {
            Random rdn = new Random();
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < dimension; j++)
                {
                    if (position[i,j] < low || position[i,j] > high)
                    {
                        position[i, j] = rdn.NextDouble() * (high - low) + low;
                    }
                }
            }
        }

        static void max_min_fitness()
        {
            maxfit = Int32.MinValue;
            minfit = Int32.MaxValue;
            for (int i = 0; i < N; i++)
            {
                if (fitness[i] < minfit)
                    minfit = fitness[i];
                if (fitness[i] > maxfit)
                    maxfit = fitness[i];
            }
        }

        static void mass_calculation()
        {
            double[] tmp_mass = new double[N];
            double mass_sum = 0;
            double best, worst;

            if (maxfit == minfit)
            {
                for (int i = 0; i < N; i++)
                    mass[i] = 1;
            }
            else
            {
                if (min_flag == 1)
                { // minimization
                    best = minfit;
                    worst = maxfit;
                }
                else
                { //maximization
                    best = maxfit;
                    worst = minfit;
                }
                for (int i = 0; i < N; i ++)
                    tmp_mass[i] = (fitness[i] - worst) / (best - worst);
                for (int i = 0; i < N; i++)
                    mass_sum += tmp_mass[i];
                for (int i = 0; i < N; i++)
                    mass[i] = tmp_mass[i] / mass_sum;
            }
        }

        static void euclid_distance_calculation()
        {
            double tmp_distance = 0;
            double tmp_euclid_distance = 0;

            for(int k = 0; k < N; k++)
            {
                for (int i = 0; i < N; i++)
                {
                    tmp_distance = 0;
                    for (int j = 0; j < dimension; j++)
                    {
                        if (k != i)
                        {
                            tmp_distance += Math.Pow((position[k, j] - position[i, j]), 2);
                        }
                        else
                        {
                            tmp_distance = 0;
                        }
                    }
                    tmp_euclid_distance = Math.Sqrt(tmp_distance);
                    euclid_distance[k, i] = tmp_euclid_distance;
                }
            }
        }

        static void acceleration_calculation()
        {

            double kbest = 0;
            int final_per = 2;
            if (elitism == 1)
            {
                double tmp ;
                tmp = (double)iteration / (double)max_it;
                kbest = final_per + (1 - tmp) * (100 - final_per);
                kbest = Math.Round(N * kbest / 100);
            }
            else
            {
                kbest = N;
            }

            //sort masses and their indexes
            int[] tmp_indexes = new int[N];
            double[] tmp_masses = new double[N];
            double tmp_swap = 0;
            for (int i = 0; i < N; i++)
            {
                tmp_masses[i] = mass[i];
                tmp_indexes[i] = i;
            }
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < N - 1; j++)
                {
                    if (tmp_masses[j + 1] > tmp_masses[j])
                    {
                        tmp_swap = tmp_masses[j + 1];
                        tmp_masses[j + 1] = tmp_masses[j];
                        tmp_masses[j] = tmp_swap;

                        tmp_swap = tmp_indexes[j + 1];
                        tmp_indexes[j + 1] = tmp_indexes[j];
                        tmp_indexes[j] = Convert.ToInt32(tmp_swap);
                    }
                }
            }

            //ulp calculation
            double value = 1;
            long bits = BitConverter.DoubleToInt64Bits(value);
            double nextValue = BitConverter.Int64BitsToDouble(bits + 1);
            double ULP = nextValue - value;

            //calculate force
            int index = 0;
            double tmp_force = 0;
            Random rdn = new Random();

            // Set force[,] to zero
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < dimension; j++)
                {
                    force[i, j] = 0;
                }
            }

            for (int i = 0; i < N; i++) // i counts agents
            {
                for (int k = 0; k < kbest; k++) 
                {
                    index = tmp_indexes[k];
                    for (int j = 0; j < dimension; j++)  //j counts dimension
                    {
                        if (index != i)
                        {
                            // Fij = G x Mi x Mj x (xj - xi) / Rij
                            tmp_force = (position[index, j] - position[i, j]) / (euclid_distance[index, i] + ULP);
                        }
                        else
                        {
                            tmp_force = 0;
                        }
                        if (double.IsNaN(tmp_force) || double.IsInfinity(tmp_force))
                        {
                            throw new ArithmeticException();
                        }
                        // Fi = Fi + rand*Fij
                        force[i, j] = force[i, j] + rdn.NextDouble() * mass[index] * tmp_force;
                    }
                }
            }

            gravity_constant = 100 * Math.Pow(Math.E, (-20 * iteration / max_it));
            // acceleration
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < dimension; j++)
                {
                    acceleration[i, j] = force[i, j] * gravity_constant;
                }
            }
        }

        static void movement_calculation()
        {
            Random rdn = new Random();

            //velocity
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < dimension; j++)
                {
                    velocity[i, j] = rdn.NextDouble() * velocity[i, j] + acceleration[i, j];
                }
            }

            //new position
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < dimension; j++)
                {
                    position[i, j] += velocity[i, j];
                }
            }

        }
        static void gsa_algorithm()
       {
            test_function_boundaries();
            initialise();

            for (iteration = 0; iteration < max_it; iteration++)
            {
                boundaries();                         // check boundaries
                
                fitness_calculation();                // calculate fitness
                
                max_min_fitness();                    // get max and min fitness
                
                if (min_flag == 1)                    // record best per iteration
                {
                    best_per_iteration[iteration] = minfit;
                }
                else
                {
                    best_per_iteration[iteration] = maxfit;
                }
                
                mean_per_iteration[iteration] = fitness.Average();   // record mean fitness per iteration
                
                mass_calculation();                   // calculate mass
                
                euclid_distance_calculation();        // calculate euclid distance
                
                acceleration_calculation();           // calculate acceleration
                
                movement_calculation();               // calculate speed and new position
            }

            string mydocpath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            string filename1 = mydocpath + "\\f_index_" +f_index + "Mean fitness.txt";
            string filename2 = mydocpath + "\\f_index_" + f_index + "Best fitness.txt";

            using (StreamWriter outputFile = new StreamWriter(filename1))
            {
                foreach (double line in mean_per_iteration)
                    outputFile.WriteLine(line);
            }
            using (StreamWriter outputFile = new StreamWriter(filename2))
            {
                foreach (double line in mean_per_iteration)
                    outputFile.WriteLine(line);
            }
        }
    }
}
