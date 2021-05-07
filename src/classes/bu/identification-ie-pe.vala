namespace Identifications {
public class IdentificationIePe : Identification {
        public IdentificationIePe () {
            generate_first_part();
            generate_first_digit();
            generate_second_digit();
        }
        protected override void generate_first_part(){
            for(int i = 0; i < 7 ; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }

        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var peso = 8;

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

        protected override void generate_second_digit(){
            var second_digit = 0;
            var sum_totaly = 0;
            var core_second_digit = identification.core.concat(identification.first_digit);
            var peso = 9;
            var division_rest = 0;

            for(int i = 0; i < core_second_digit.length; i++){
                    sum_totaly += int.parse(core_second_digit[i].to_string()) * peso;
                    peso--;
                }

            division_rest = sum_totaly % 11;

            if(division_rest != 0 && division_rest != 1){
                second_digit = 11 - division_rest;
            }

            identification.second_digit = second_digit.to_string();
        }

        public override string get_identification_formmated(){
            var cnpj_formmated = new StringBuilder();
            cnpj_formmated.append(get_identification());
            cnpj_formmated.insert(7,"-");
            return cnpj_formmated.str;
        }
    }
}
