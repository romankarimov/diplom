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
    public class OrganizationDB
    {
        
            private string connectionString;

            public OrganizationDB()
            {
                // Извлечь из файла web.config строку соединения по умолчанию
                connectionString = WebConfigurationManager.
                    ConnectionStrings["mssqltur"].ConnectionString;
            }

            public OrganizationDB(string connectionStringCustom)
            {
                // Извлечь из файла web.config другую строку соединения
                connectionString = WebConfigurationManager.
                    ConnectionStrings[connectionStringCustom].ConnectionString;
            }

            public int InsertOrganization(torganization emp1)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("InsertOrganization", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Director", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Director"].Value = emp1.Director;
                cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Name"].Value = emp1.Name;
                cmd.Parameters.Add(new SqlParameter("@Position", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Position"].Value = emp1.Position;
                cmd.Parameters.Add(new SqlParameter("@Orgface", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Orgface"].Value = emp1.Orgface;
                cmd.Parameters.Add(new SqlParameter("@Address1", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Address1"].Value = emp1.Address1;
                cmd.Parameters.Add(new SqlParameter("@Orgemail", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Orgemail"].Value = emp1.Orgemail;
                cmd.Parameters.Add(new SqlParameter("@Orgphone", SqlDbType.NVarChar, 20));
                cmd.Parameters["@Orgphone"].Value = emp1.Orgphone;
                cmd.Parameters.Add(new SqlParameter("@Address2", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Address2"].Value = emp1.Address2;
                cmd.Parameters.Add(new SqlParameter("@Contactname", SqlDbType.NVarChar, 150));
                cmd.Parameters["@Contactname"].Value = emp1.Contactname;
                cmd.Parameters.Add(new SqlParameter("@Bank", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Bank"].Value = emp1.Bank;
                cmd.Parameters.Add(new SqlParameter("@Contactposition", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Contactposition"].Value = emp1.Contactposition;
                cmd.Parameters.Add(new SqlParameter("@Rschet", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Rschet"].Value = emp1.Rschet;
                cmd.Parameters.Add(new SqlParameter("@Contactphone", SqlDbType.NVarChar, 20));
                cmd.Parameters["@Contactphone"].Value = emp1.Contactphone;
                cmd.Parameters.Add(new SqlParameter("@Orgschet", SqlDbType.NVarChar, 100));
                cmd.Parameters["@Orgschet"].Value = emp1.Orgschet;
                cmd.Parameters.Add(new SqlParameter("@Bikbank", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Bikbank"].Value = emp1.Bikbank;
                cmd.Parameters.Add(new SqlParameter("@Inn", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Inn"].Value = emp1.Inn;
                cmd.Parameters.Add(new SqlParameter("@Kpp", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Kpp"].Value = emp1.Kpp;
                cmd.Parameters.Add(new SqlParameter("@Ogrn", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Ogrn"].Value = emp1.Ogrn;
                cmd.Parameters.Add(new SqlParameter("@Okpo", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Okpo"].Value = emp1.Okpo;
                cmd.Parameters.Add(new SqlParameter("@OrganizationID", SqlDbType.Int, 4));
                cmd.Parameters["@OrganizationID"].Direction = ParameterDirection.Output;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    return (int)cmd.Parameters["@OrganizationID"].Value;
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

            public void DeleteOrganization(int OrganizationID)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("DeleteOrganization", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@OrganizationID", SqlDbType.Int, 4));
                cmd.Parameters["@OrganizationID"].Value = OrganizationID;

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

            public void UpdateOrganization(int OrganizationID, string Name, string Director, string Position,
            string Orgface, string Address1, string Orgemail, string Orgphone, string Address2,
            string Contactname, string Contactposition, string Contactphone,
            string Bikbank, string Bank, string Rschet, string Orgschet,
            string Inn, string Kpp, string Ogrn, string Okpo)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("UpdateOrganization", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Director", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Director"].Value =  Director;
                cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Name"].Value = Name;
                cmd.Parameters.Add(new SqlParameter("@Position", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Position"].Value =  Position;
                cmd.Parameters.Add(new SqlParameter("@Orgface", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Orgface"].Value =  Orgface;
                cmd.Parameters.Add(new SqlParameter("@Address1", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Address1"].Value =  Address1;
                cmd.Parameters.Add(new SqlParameter("@Orgemail", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Orgemail"].Value =  Orgemail;
                cmd.Parameters.Add(new SqlParameter("@Orgphone", SqlDbType.NVarChar, 20));
                cmd.Parameters["@Orgphone"].Value =  Orgphone;
                cmd.Parameters.Add(new SqlParameter("@Address2", SqlDbType.NVarChar, 200));
                cmd.Parameters["@Address2"].Value =  Address2;
                cmd.Parameters.Add(new SqlParameter("@Contactname", SqlDbType.NVarChar, 150));
                cmd.Parameters["@Contactname"].Value =  Contactname;
                cmd.Parameters.Add(new SqlParameter("@Bank", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Bank"].Value =  Bank;
                cmd.Parameters.Add(new SqlParameter("@Contactposition", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Contactposition"].Value =  Contactposition;
                cmd.Parameters.Add(new SqlParameter("@Rschet", SqlDbType.NVarChar, 100));
                cmd.Parameters["@Rschet"].Value =  Rschet;
                cmd.Parameters.Add(new SqlParameter("@Contactphone", SqlDbType.NVarChar, 20));
                cmd.Parameters["@Contactphone"].Value =  Contactphone;
                cmd.Parameters.Add(new SqlParameter("@Orgschet", SqlDbType.NVarChar, 100));
                cmd.Parameters["@Orgschet"].Value =  Orgschet;
                cmd.Parameters.Add(new SqlParameter("@Bikbank", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Bikbank"].Value =  Bikbank;
                cmd.Parameters.Add(new SqlParameter("@Inn", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Inn"].Value =  Inn;
                cmd.Parameters.Add(new SqlParameter("@Kpp", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Kpp"].Value =  Kpp;
                cmd.Parameters.Add(new SqlParameter("@Ogrn", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Ogrn"].Value =  Ogrn;
                cmd.Parameters.Add(new SqlParameter("@Okpo", SqlDbType.NVarChar, 50));
                cmd.Parameters["@Okpo"].Value =  Okpo;
                cmd.Parameters.Add(new SqlParameter("@OrganizationID", SqlDbType.Int, 4));
                cmd.Parameters["@OrganizationID"].Value = OrganizationID;

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

            public string GetNameOrg(int id)
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("Select name from organization where organizationID = @id", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 10));
                cmd.Parameters["@id"].Value = id;

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    return (string)reader["name"];
                    reader.Close();

                }
                catch
                {
                    throw new ApplicationException("Ошибка данныx!");
                }
                finally
                {
                    con.Close();
                }
            }

            public List<torganization > GetAllOrganizations()
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("GetAllOrganizations", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Создать коллекцию для всех записей 
                List<torganization> Organizations = new List<torganization>();

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        torganization emp = new torganization(
                        (int)reader["organizationID"],
                        (string)reader["name"],
                        (string)reader["director"],
                        (string)reader["position"],
                        (string)reader["orgface"],
                        (string)reader["address1"],
                        (string)reader["orgemail"],
                        (string)reader["orgphone"],
                        (string)reader["address2"],
                        (string)reader["contactname"],
                        (string)reader["contactposition"],
                        (string)reader["contactphone"],
                        (string)reader["bikbank"],
                        (string)reader["bank"],
                        (string)reader["rschet"],
                        (string)reader["orgschet"],
                        (string)reader["inn"],
                        (string)reader["kpp"],
                        (string)reader["ogrn"],
                        (string)reader["okpo"]);
                        Organizations.Add(emp);
                    }
                    reader.Close();
                    return Organizations;
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

            //
        
    }
}
