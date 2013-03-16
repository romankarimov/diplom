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
 * Класс "Турист: организация"
 */
namespace turist.App_Code
{
    public class torganization
    {
        public torganization(int organizationID, string name, string director, string position, 
            string orgface, string address1, string orgemail, string orgphone, string address2, 
            string contactname, string contactposition, string contactphone, 
            string bikbank, string bank, string rschet, string orgschet, 
            string inn, string kpp, string ogrn, string okpo)
        {
            this.organizationID = organizationID;
            this.name = name;
            this.director=director;
            this.position=position;
            this.orgface=orgface;
            this.address1=address1;
            this.orgemail=orgemail;
            this.orgphone=orgphone;
            this.address2=address2;
            this.contactname=contactname;
            this.contactposition=contactposition;
            this.contactphone=contactphone;
            this.bikbank=bikbank;
            this.bank=bank;
            this.rschet=rschet;
            this.orgschet=orgschet;
            this.inn=inn;
            this.kpp = kpp;
            this.ogrn = ogrn;
            this.okpo = okpo;
        }
        public torganization() { }

        private int organizationID;
        public int OrganizationID
        {
            get { return organizationID; }
            set { organizationID = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string director;
        public string Director
        {
            get { return director; }
            set { director = value; }
        }

        private string position;
        public string Position
        {
            get { return position; }
            set { position = value; }
        }

        private string orgface;
        public string Orgface
        {
            get { return orgface; }
            set { orgface = value; }
        }

        private string address1;
        public string Address1
        {
            get { return address1; }
            set { address1 = value; }
        }

        private string orgemail;
        public string Orgemail
        {
            get { return orgemail; }
            set { orgemail = value; }
        }

        private string orgphone;
        public string Orgphone
        {
            get { return orgphone; }
            set { orgphone = value; }
        }

        private string address2;
        public string Address2
        {
            get { return address2; }
            set { address2 = value; }
        }

        private string contactname;
        public string Contactname
        {
            get { return contactname; }
            set { contactname = value; }
        }

        private string bank;
        public string Bank
        {
            get { return bank; }
            set { bank = value; }
        }

        private string contactposition;
        public string Contactposition
        {
            get { return contactposition; }
            set { contactposition = value; }
        }

        private string rschet;
        public string Rschet
        {
            get { return rschet; }
            set { rschet = value; }
        }

        private string contactphone;
        public string Contactphone
        {
            get { return contactphone; }
            set { contactphone = value; }
        }

        private string orgschet;
        public string Orgschet
        {
            get { return orgschet; }
            set { orgschet = value; }
        }

        private string bikbank;
        public string Bikbank
        {
            get { return bikbank; }
            set { bikbank = value; }
        }

        private string inn;
        public string Inn
        {
            get { return inn; }
            set { inn = value; }
        }

        private string kpp;
        public string Kpp
        {
            get { return kpp; }
            set { kpp = value; }
        }
        
        private string ogrn;
        public string Ogrn
        {
            get { return ogrn; }
            set { ogrn = value; }
        }

        private string okpo;
        public string Okpo
        {
            get { return okpo; }
            set { okpo = value; }
        }
    }
    
}
