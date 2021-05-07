namespace Identifications{
    public class IdentificationModel : GLib.Object {
        private string _core;
        private string _first_digit;
        private string _second_digit;
        private string _branche;

        public string core{
            get{return _core;}
            set{_core = value;}
        }

        public string first_digit{
            get{return _first_digit;}
            set{_first_digit = value;}
        }

        public string second_digit{
            get{return _second_digit;}
            set{_second_digit = value;}
        }
        public string branche{
            get{return _branche;}
            set{_branche = value;}
        }

        public IdentificationModel () {
            _core = "";
            _first_digit = "";
            _second_digit = "";
            _branche = "";
        }
   }
}
