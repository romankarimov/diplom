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
 * Класс "Турист: физ.лицо"
 */
namespace turist.App_Code
{
    public class fotopeople
    {
        public fotopeople() { }
        public fotopeople(int id, int idpeople, string comment, string path)
        {
            this.id = id;
            this.idpeople = idpeople;
            this.path = path;
            this.comment = comment;
        }


        private int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string comment;
        public string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        private int idpeople;
        public int Idpeople
        {
            get { return idpeople; }
            set { idpeople = value; }
        }



        private string path;
        public string Path
        {
            get { return path; }
            set { path = value; }
        }
    } //- Класс фото физлиц 
    public class tpeople
    {
        public tpeople(int peopleID, string fio, string fiolat, 
            string sex, string address, string email, string phone, string birthday, 
            string seriapasp, string numberpasp, string whopasp, string wherepasp, 
            string seriazpasp, string numberzpasp, string whozpasp, string wherezpasp, string wherendzpasp)
        {
            this.peopleID = peopleID;
            this.fio=fio;
            this.fiolat=fiolat;
            this.sex=sex;
            this.address=address;
            this.email=email;
            this.phone=phone;
            this.birthday=birthday;
            this.seriapasp=seriapasp;
            this.numberpasp=numberpasp;
            this.whopasp=whopasp;
            this.wherepasp=wherepasp;
            this.seriazpasp=seriazpasp;
            this.numberzpasp=numberzpasp;
            this.whozpasp=whozpasp;
            this.wherezpasp=wherezpasp;
            this.wherendzpasp=wherendzpasp;
        }
        public tpeople() { }

        private int peopleID;
        public int PeopleID
        {
            get { return peopleID; }
            set { peopleID = value; }
        }

        private string fio;
        public string Fio
        {
            get { return fio; }
            set { fio = value; }
        }

        private string fiolat;
        public string FioLat
        {
            get { return fiolat; }
            set { fiolat = value; }
        }

        private string sex;
        public string Sex
        {
            get { return sex; }
            set { sex = value; }
        }

        private string address;
        public string Address
        {
            get { return address; }
            set { address = value; }
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

        private string birthday;
        public string Birthday
        {
            get { return birthday; }
            set { birthday = value; }
        }

        private string seriapasp;
        public string Seriapasp
        {
            get { return seriapasp; }
            set { seriapasp = value; }
        }

        private string seriazpasp;
        public string Seriazpasp
        {
            get { return seriazpasp; }
            set { seriazpasp = value; }
        }

        private string numberpasp;
        public string Numberpasp
        {
            get { return numberpasp; }
            set { numberpasp = value; }
        }

        private string numberzpasp;
        public string Numberzpasp
        {
            get { return numberzpasp; }
            set { numberzpasp = value; }
        }

        private string whopasp;
        public string Whopasp
        {
            get { return whopasp; }
            set { whopasp = value; }
        }

        private string whozpasp;
        public string Whozpasp
        {
            get { return whozpasp; }
            set { whozpasp = value; }
        }

        private string wherepasp;
        public string Wherepasp
        {
            get { return wherepasp; }
            set { wherepasp = value; }
        }

        private string wherezpasp;
        public string Wherezpasp
        {
            get { return wherezpasp; }
            set { wherezpasp = value; }
        }

        private string wherendzpasp;
        public string Wherendzpasp
        {
            get { return wherendzpasp; }
            set { wherendzpasp = value; }
        }


    }  //- Класс физ лица
       
}
