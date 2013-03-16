using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Web.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace turist.App_Code
{
    public class OrderDB
    {
            private string connectionString;

            public OrderDB()
            {
                // Извлечь из файла web.config строку соединения по умолчанию
                connectionString = WebConfigurationManager.
                    ConnectionStrings["mssqltur"].ConnectionString;
                    
            }

            public OrderDB(string connectionStringCustom)
            {
                
                // Извлечь из файла web.config другую строку соединения
                connectionString = WebConfigurationManager.
                    ConnectionStrings[connectionStringCustom].ConnectionString;
            }
        

            public int InsertOrder(Order emp1)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("InsertOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@numbdogov", SqlDbType.NVarChar, 50));
                cmd.Parameters["@numbdogov"].Value = emp1.Numbdogov;
                cmd.Parameters.Add(new SqlParameter("@t_bazaID", SqlDbType.Int, 6));
                cmd.Parameters["@t_bazaID"].Value = emp1.T_bazaID;
               
                cmd.Parameters.Add(new SqlParameter("@clientIDppl", SqlDbType.Int, 6));
                cmd.Parameters["@clientIDppl"].Value = emp1.ClientIDppl;
                
                cmd.Parameters.Add(new SqlParameter("@datein", SqlDbType.NVarChar, 20));
                cmd.Parameters["@datein"].Value = emp1.Datein;
                cmd.Parameters.Add(new SqlParameter("@dateout", SqlDbType.NVarChar, 20));
                cmd.Parameters["@dateout"].Value = emp1.Dateout;
                cmd.Parameters.Add(new SqlParameter("@orderID", SqlDbType.Int, 6));
                cmd.Parameters["@orderID"].Direction = ParameterDirection.Output;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    return (int)cmd.Parameters["@orderID"].Value;
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                }
                finally
                {
                    con.Close();
                }
            }
            public void InsertTemp(string datedoc,  string orderid)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("update tempdata set datedoc = @datedoc,orderid = @orderid where id = 1", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("@datedoc", SqlDbType.NVarChar, 50));
                cmd.Parameters["@datedoc"].Value = datedoc;
               
                cmd.Parameters.Add(new SqlParameter("@orderid", SqlDbType.NVarChar, 6));
                cmd.Parameters["@orderid"].Value = orderid;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                }
                finally
                {
                    con.Close();
                }
            }

            public void DeleteOrder(int orderID)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("DeleteOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@orderID", SqlDbType.Int, 6));
                cmd.Parameters["@orderID"].Value = orderID;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                }
                finally
                {
                    con.Close();
                }
            }

            public int ClearTable()
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("delete orders; delete orderpeople; delete orderservice", con);
                cmd.CommandType = CommandType.Text;
                
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    return 1;
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                }
                finally
                {
                    con.Close();
                }
            }

            public void UpdateOrder(int orderID, string numbdogov,
            int t_bazaID, int t_gostID, int t_teplID, int t_zagrID,
            int clientIDppl, int clientIDorg, int clientgo,
              string datein, int time, int pasptype)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("UpdateOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@numbdogov", SqlDbType.NVarChar, 10));
                cmd.Parameters["@numbdogov"].Value = numbdogov;
                cmd.Parameters.Add(new SqlParameter("@t_bazaID", SqlDbType.Int, 6));
                cmd.Parameters["@t_bazaID"].Value = t_bazaID;
                cmd.Parameters.Add(new SqlParameter("@t_teplID", SqlDbType.Int, 6));
                cmd.Parameters.Add(new SqlParameter("@t_gostID", SqlDbType.Int, 6));
                cmd.Parameters["@t_gostID"].Value = t_gostID;

                cmd.Parameters["@t_teplID"].Value = t_teplID;
                cmd.Parameters.Add(new SqlParameter("@t_zagrID", SqlDbType.Int, 6));
                cmd.Parameters["@t_zagrID"].Value = t_zagrID;
                cmd.Parameters.Add(new SqlParameter("@clientIDppl", SqlDbType.Int, 6));
                cmd.Parameters["@clientIDppl"].Value = clientIDppl;
                cmd.Parameters.Add(new SqlParameter("@clientIDorg", SqlDbType.Int, 6));
                cmd.Parameters["@clientIDorg"].Value = clientIDorg;
                cmd.Parameters.Add(new SqlParameter("@clientgo", SqlDbType.Int, 1));
                cmd.Parameters["@clientgo"].Value = clientgo;
                cmd.Parameters.Add(new SqlParameter("@datein", SqlDbType.NVarChar, 10));
                cmd.Parameters["@datein"].Value = datein;
                cmd.Parameters.Add(new SqlParameter("@time", SqlDbType.Int, 3));
                cmd.Parameters["@time"].Value = time;
                cmd.Parameters.Add(new SqlParameter("@pasptype", SqlDbType.Int, 1));
                cmd.Parameters["@pasptype"].Value = pasptype;
                cmd.Parameters.Add(new SqlParameter("@orderID", SqlDbType.Int, 6));
                cmd.Parameters["@orderID"].Value = orderID;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                }
                finally
                {
                    con.Close();
                }
            }

            public List<Order> GetAllOrders()
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("GetAllOrders", con);
                cmd.CommandType = CommandType.StoredProcedure;
                
                List<Order> Orders = new List<Order>();

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    
                    while (reader.Read())
                    {
                        
                        Order emp = new Order(
                        (int)reader["orderID"],
                        (string)reader["numbdogov"],
                        (int)reader["t_bazaID"],
                        
                        (int)reader["clientIDppl"],
              
                       // turists,
                        (string)reader["datein"],
                        (string)reader["dateout"]
                        );
                        

                        Orders.Add(emp);
                    }
                    reader.Close();
                    return Orders;
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                }
                finally
                {
                    con.Close();
                }
            }
            public Order GetOrdere(int orderid)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("GetOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@orderID", SqlDbType.Int, 6));
                cmd.Parameters["@orderID"].Value = orderid;

                Order Or = new Order();
                try
                {
                    con.Open();
                   
                    SqlDataReader reader = cmd.ExecuteReader();
                        Or.OrderID = orderid;
                        Or.Numbdogov = (string)reader["numbdogov"];
                        Or.T_bazaID = (int)reader["t_bazaID"];

                        Or.ClientIDppl = (int)reader["clientIDppl"];
                        Or.Datein = (string)reader["datein"];
                        Or.Dateout = (string)reader["dateout"];
                    
                        reader.Close();
                        return Or;
                       
                    
                    
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                }
                finally
                {
                    con.Close();
                }
            }

            public string GetTemp()
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("select tempdata.datedoc from tempdata", con);
                cmd.CommandType = CommandType.Text;

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    string news = (string)reader["datedoc"];
                    reader.Close();
                    return news;

                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");

                }
                finally
                {
                    con.Close();
                }

            }
            public string GetTemp1()
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("getdatedoc", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new SqlParameter("@orderID", SqlDbType.Int, 6));
                //cmd.Parameters["@orderID"].Direction = ParameterDirection.Output;
                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    string news = (string)reader["datedoc"];
                    reader.Close();
                    return news;

                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                    
                }
                finally
                {
                    con.Close();
                }

            }

            public string GetTemp2()
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("getorderid", con);
                cmd.CommandType = CommandType.StoredProcedure;

               

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    string news = (string)reader["orderid"];
                    reader.Close();
                    return (news);
                   
                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                    
                }
                finally
                {
                    con.Close();
                }
            }
            public List<cervice> GetServiceOrder(int order)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("GetOrderServices", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@orderid", SqlDbType.Int, 6));
                cmd.Parameters["@orderid"].Value = order;
                List<cervice> news = new List<cervice>();

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {

                        cervice emp = new cervice(
                      1,
                        (string)reader["name"],
                        (int)reader["cost"],
                        
                       ""
                        );
                        news.Add(emp);

                        
                    }
                    reader.Close();
                    return (news);

                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx.");
                }
                finally
                {
                    con.Close();
                }
            } 
          
    }
}
