namespace Identifications {
    public class IdentificationIeAp : Identification {
       public IdentificationIeAp () {
            generate_first_part();
            generate_first_digit();
       }
         protected override void generate_first_part(){
            identification.core = "03";

            for(int i = 0; i <6 ; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }

        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var product = 0;
            var division_rest = 0;
            var p = 0;
            var d = 0;
            var core = "";
            var peso = 9;


            for(int i = 0; i < identification.core.length; i++){
                sum_totaly += int.parse(identification.core[i].to_string()) * peso;
                if(i > 0){
                    core += int.parse(identification.core[i].to_string()).to_string();
                }
                peso--;
            }

            if(int.parse(core) >= 3000001 &&  int.parse(core) <= 3017000 ){
                p = 5;

            }else if(int.parse(core) >= 3017001 && int.parse(core) <= 3019022 ){
                p = 9;
                d = 1;
            }
            product = p + sum_totaly ;

            division_rest = product % 11;

            if(11 - division_rest == 11){
                first_digit = d;
            }else if(11 - division_rest != 10){
                first_digit = 11 - division_rest;
            }

           identification.first_digit = first_digit.to_string();
        }

        public override string get_identification_formmated(){
            var cnpj_formmated = new StringBuilder();
            cnpj_formmated.append(get_identification());
            cnpj_formmated.insert(8,"-");
            cnpj_formmated.insert(2,".");
            return cnpj_formmated.str;
        }
   }
}
