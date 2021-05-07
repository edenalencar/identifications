namespace Identifications {
    public class IdentificationIeMa : Identification {
         public IdentificationIeMa () {
            generate_first_part();
            generate_first_digit();
            generate_second_digit();
         }

        protected override void generate_first_part(){
            identification.core += "12";
            for(int i = 0; i < 6 ; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }

        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var peso = 9;

            for(int i = 0; i <  identification.core.length; i++){
                sum_totaly +=  int.parse(identification.core[i].to_string()) * peso;
                peso--;
            }

            var division_rest = sum_totaly % 11;
            if (division_rest != 0 && division_rest != 1){
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
