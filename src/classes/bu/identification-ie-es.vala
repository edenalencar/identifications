namespace Identifications {
    public class IdentificationIeEs : Identification {

        public IdentificationIeEs () {
            generate_first_part();
            generate_first_digit();
            generate_second_digit();
        }

        protected override void generate_first_part(){
            for(int i = 0; i < 8 ; i++ ){
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

            var calc_first_digit = sum_totaly % 11;

            if(calc_first_digit > 1 ){
                first_digit = 11 - calc_first_digit;
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
