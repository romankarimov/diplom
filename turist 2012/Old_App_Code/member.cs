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
/*
 * Класс "Пользователь"
 */
namespace turist.App_Code
{
    public class member
    {
        public member(int memberID, string fio, string address, 
            string phone, string email, int role)
        {
            this.memberID = memberID;
            this.fio=fio;
            this.role = role;
            this.email=email;
            this.phone=phone;
        }

        public member() { }

        private int memberID;
        public int MemberID
        {
            get { return memberID; }
            set { memberID = value; }
        }

        private string fio;
        public string Fio
        {
            get { return fio; }
            set { fio = value; }
        }

        private int role;
        public int Role
        {
            get { return role; }
            set { role = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string phone;
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
    }
    public class menedger
    {
        public menedger(int id, int idturoperator, string fio, 
            string phone, string email)
        {
            this.id = id;
            this.fio = fio;
            this.idturoperator = idturoperator;
            this.email = email;
            this.phone = phone;
        }

        public menedger() { }

        private int id;
        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        private int idturoperator;
        public int Idturoperator
        {
            get { return idturoperator; }
            set { idturoperator = value; }
        }

        private string fio;
        public string Fio
        {
            get { return fio; }
            set { fio = value; }
        }

        private int role;
        public int Role
        {
            get { return role; }
            set { role = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string phone;
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
    }
}
