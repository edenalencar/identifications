namespace Identifications {
public class IdentificationIeRj : Identification {
        public IdentificationIeRj () {
            generate_first_part();
            generate_first_digit();
        }
        protected override void generate_first_part(){
            for(int i = 0; i < 7; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }

        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var peso = 7;


            for(int i = 0; i < identification.core.length; i++){
                if(i == 0){
                    sum_totaly +=  int.parse(identification.core[i].to_string()) * 2;

                }else{
                    sum_totaly +=  int.parse(identification.core[i].to_string()) * peso;
                    peso--;
                }

            }

            var division_rest = sum_totaly % 11;
            if (division_rest > 1){
                first_digit = 11 - division_rest;
            }

            identification.first_digit = first_digit.to_string();
        }

        public override string get_identification_formmated(){
            var cnpj_formmated = new StringBuilder();
            cnpj_formmated.append(get_identification());
            cnpj_formmated.insert(7,"-");
            return cnpj_formmated.str;
        }
    }
}
