using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiPopryzhonok.Model
{
   public  class ResponseAgent
    {
        public ResponseAgent (Agent agent)
        {
            this.ID = agent.ID;
            this.Title = agent.Title;
            this.IDAgentType = agent.IDAgentType;
            this.Email = agent.Email;
            this.Phone = agent.Phone;
            this.Logotype = agent.Logotype;
            this.Adress = agent.Adress;
            this.Priority = agent.Priority;
            this.Director = agent.Director;
            this.INN = agent.INN;
            this.KPP = agent.KPP;
        }

        public ResponseAgent() { }
        public int ID { get; set; }
        public string Title { get; set; }
        public int IDAgentType { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Logotype { get; set; }
        public string Adress { get; set; }
        public int Priority { get; set; }
        public string Director { get; set; }
        public int INN { get; set; }
        public int KPP { get; set; }
    }
}
