namespace Identifications {
    public class IdentificationIePb : Identification {
        public IdentificationIePb () {
            generate_first_part();
            generate_first_digit();
        }
        protected override void generate_first_part(){
            for(int i = 0; i < 8; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }

        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var peso = 9;

            for(int i = 0; i < identification.core.length; i++){
                sum_totaly +=  int.parse(identification.core[i].to_string()) * peso;
                peso--;
            }

            var division_rest = 11 - (sum_totaly % 11);
            if (division_rest != 10 && division_rest != 11){
                first_digit = division_rest;
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
