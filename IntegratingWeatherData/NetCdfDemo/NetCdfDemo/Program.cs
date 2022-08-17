using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

// I install the 32 bit version netCDF4.9.0-NC4-32.exe  https://docs.unidata.ucar.edu/netcdf-c/current/winbin.html
using Microsoft.Research.Science.Data;
using Microsoft.Research.Science.Data.NetCDF4;
using Microsoft.Research.Science.Data.Memory;
using Microsoft.Research.Science.Data.Imperative;

namespace NetCdfDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            // 
            float RiskLatitude = 37.41977911f;
            float RiskLongitude = -76.4411341f;

            string currentFile = @"C:\Users\bfellows\source\repos\presentations\IntegratingWeatherData\NetCdfDemo\nws_precip_1day_20220812_conus.nc";

            int latIndex = 0;
            int longIndex = 0;
            int maxX = 1121;
            int maxY = 881;

            // Lat/long conversion to coordinate system
            // Except that this expects radian degrees and not decimal degrees
            //  radianAngle = decimalAngle * Pi / 180.0
            {
                double xlat = 0;
                xlat = (double)RiskLatitude;
                double xlon = 0;
                // Converting to positive value.
                xlon = Math.Abs((double)RiskLongitude);
                double earthr = 6371.2f; // radius of the earth in km
                double xmesh = 4.7625f; // mesh length of at 60 degrees latitude in km
                double re = (earthr * (1 + Math.Sin(60 * Math.PI / 180.0))) / xmesh;
                double r = (re * Math.Cos(xlat * Math.PI / 180.0)) / (1 + Math.Sin(xlat * Math.PI / 180.0));
                double wlong = xlon + 75;
                double x = r * Math.Sin(wlong * Math.PI / 180.0) + 401;
                double y = r * Math.Cos(wlong * Math.PI / 180.0) + 1601;

                latIndex = (int)Math.Round(y, 0);
                longIndex = (int)Math.Round(x, 0);

                if (x > maxX || y > maxY || x < 0 || y < 0)
                {
                    Console.WriteLine($"Source is outside of conus boundaries ({x}, {y}) ");
                    throw new Exception($"Source is outside of conus boundaries ({x}, {y}) ");
                }
            }

            try
            {
                FileInfo fiSourceLoopFile = new FileInfo(currentFile);
                if (fiSourceLoopFile.Exists)
                {
                    string sourceFileURI = "msds:nc?file=" + fiSourceLoopFile.FullName + "&openMode=readOnly"; // sets the source file to open in read only mode
                    using (NetCDFDataSet sourceNDS = new NetCDFDataSet(sourceFileURI))
                    {
                        // sourceNDS.Variables
                        // At this point, let's find all the available variables and stuff them into a thing
                        foreach (Variable item in sourceNDS.Variables.Where(v => v.Name == "observation"))
                        {
                                // float hours\ 8-14\ EDT\ strike\ 0.5in(y, x) ;
                                // strikes[item.Name] = sourceNDS.GetData<float[,]>(item.ID)[latIndex, longIndex] / 100.0f;
                                var obs = sourceNDS.GetData<float[,]>(item.ID)[latIndex, longIndex];
                                Console.WriteLine($"Survey says!\n {currentFile}\n\t({RiskLatitude}, {RiskLongitude}) translates to ({latIndex}, {longIndex}) with {obs} in of rainfall");
                        }
                    }
                }
                else
                {
                    Console.WriteLine("No file found - fix the value of currentFile.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            Console.WriteLine("Press any key to exit");
            Console.ReadKey();
        }
    }
}
