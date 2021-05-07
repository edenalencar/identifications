namespace Identifications {
    public class IdentificationIeGo : Identification {
        public IdentificationIeGo () {
            generate_first_part();
            generate_first_digit();
            generate_second_digit();
           }

        protected override void generate_first_part(){
            identification.core += "10";
            for(int i = 0; i < 6 ; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }

        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var peso = 9;
            long identification_start = 10103105;
            long identification_end = 10119997;

            for(int i = 0; i <  identification.core.length; i++){
                sum_totaly +=  int.parse(identification.core[i].to_string()) * peso;
                peso--;
            }

            var division_rest = sum_totaly % 11;

            if(division_rest == 1 && (identification_start <= long.parse(identification.core) && identification_end >= long.parse(identification.core))){
                first_digit = division_rest;

            }else if(division_rest != 0 && division_rest != 1){
                first_digit = 11 - division_rest;

            }
            identification.first_digit = first_digit.to_string();
        }

        public override string get_identification_formmated(){
            var cnpj_formmated = new StringBuilder();
            cnpj_formmated.append(get_identification());
            cnpj_formmated.insert(8,"-");
            return cnpj_formmated.str;
        }
    }
}
