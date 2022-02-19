using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Buffers;
using System.Text.Json;
using System.Net;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using ApiPopryzhonok.Context;
using ApiPopryzhonok.Model;
using System.IO;

namespace ApiPopryzhonok
{
    class Program
    {
        static void Main()
        {
            HttpListener server = new HttpListener();
            server.Prefixes.Add("http://localhost:21890/");

            JsonSerializerOptions options = new JsonSerializerOptions() { Encoder = JavaScriptEncoder.Create(UnicodeRanges.All) };
            server.Start();

            while(true)
            {
                HttpListenerContext context = server.GetContext();
                if (context.Request.HttpMethod == "GET")
                {
                    try
                    {
                        if (context.Request.RawUrl == "/api/agent")
                        {
                            var agentList = Data.pe.Agent.ToList();
                            string responce = JsonSerializer.Serialize(Data.pe.Agent.ToList().ConvertAll(a => new ResponseAgent(a)), options);
                            byte[] data = Encoding.UTF8.GetBytes(responce);
                            context.Response.ContentType = "application/json;charset=utf-8";
                            using (Stream stream = context.Response.OutputStream)
                            {
                                context.Response.StatusCode = 200;
                                stream.Write(data, 0, data.Length);
                            }
                        }
                        else throw new Exception();
                    }
                    catch
                    {
                        context.Response.StatusCode = 400;
                        context.Response.Close();
                    }
                }
                else if (context.Request.HttpMethod == "POST")
                {
                    try
                    {
                        if (context.Request.RawUrl == "/api/agent")
                        {
                            if (context.Request.ContentType == "application/json")
                            {
                                string request = "";
                                byte[] data = new byte[context.Request.ContentLength64];
                                using (Stream stream = context.Request.InputStream)
                                {
                                    stream.Read(data, 0, data.Length);
                                }
                                request = System.Text.UTF8Encoding.UTF8.GetString(data);
                                var agentList = JsonSerializer.Deserialize<List<ResponseAgent>>(request);
                                foreach (var agent in agentList)
                                {
                                    Agent agents = new Agent();
                                    agents.ID = agent.ID;
                                    agents.Title = agent.Title;
                                    agents.IDAgentType = agent.IDAgentType;
                                    agents.Email = agent.Email;
                                    agents.Phone = agent.Phone;
                                    agents.Logotype = agent.Logotype;
                                    agents.Adress = agent.Adress;
                                    agents.Priority = agent.Priority;
                                    agents.Director = agent.Director;
                                    agents.INN = agent.INN;
                                    agents.KPP = agent.KPP;
                                    Data.pe.Agent.Add(agents);
                                }
                                Data.pe.SaveChanges();
                                context.Response.StatusCode = 200;
                                context.Response.Close();

                            }
                            else
                                throw new Exception();
                        }
                        else
                            throw new Exception();
                    }
                    catch
                    {
                        context.Response.StatusCode = 400;
                        context.Response.Close();
                    }


                }
                else
                {
                    try
                    {
                        if (context.Request.HttpMethod == "DELETE")
                        {
                            if (context.Request.QueryString.Count == 1)
                            {
                                if (context.Request.QueryString.Keys[0] == "id")
                                {
                                    int id = Convert.ToInt32(context.Request.QueryString.Get(0));
                                    var currentAgent = Data.pe.Agent.FirstOrDefault(b => b.ID == id);
                                    if (currentAgent != null)
                                    {
                                        Data.pe.Agent.Remove(currentAgent);
                                        Data.pe.SaveChanges();
                                        context.Response.StatusCode = (int)HttpStatusCode.OK;
                                        context.Response.Close();
                                    }
                                    else
                                        throw new Exception();
                                }
                                else
                                    throw new Exception();
                            }
                            else
                                throw new Exception();

                        }
                        else
                            throw new Exception();
                    }
                    catch
                    {
                        context.Response.StatusCode = 400;
                        context.Response.Close();
                    }
                }
            }
        }
    }
}
