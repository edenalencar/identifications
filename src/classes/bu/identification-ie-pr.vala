namespace Identifications {
    public class IdentificationIePr : Identification {
        public IdentificationIePr () {
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
            var peso_two_digits = 3;
            var peso = 7;

            for(int i = 0; i <  identification.core.length; i++){
                 if(i <= 1){
                    sum_totaly +=  int.parse(identification.core[i].to_string()) * peso_two_digits;
                    peso_two_digits--;
                }else{
                    sum_totaly +=  int.parse(identification.core[i].to_string()) * peso;
                    peso--;
                }
            }

            var division_rest = 11 - (sum_totaly % 11);
            if (division_rest != 10 && division_rest != 11){
                first_digit = division_rest;
            }

            identification.first_digit = first_digit.to_string();
        }

        protected override void generate_second_digit(){
            var second_digit = 0;
            var sum_totaly = 0;
            var core_second_digit = identification.core.concat(identification.first_digit);
            var peso_one = 7;
            var peso_two = 4;
            var division_rest = 0;

            for(int i = 0; i < core_second_digit.length; i++){
                if(i < 3){
                    sum_totaly += int.parse(core_second_digit[i].to_string()) * peso_two;
                    peso_two--;
                }else{
                    sum_totaly += int.parse(core_second_digit[i].to_string()) * peso_one;
                    peso_one--;
                }
            }

            division_rest = 11 - (sum_totaly % 11);

            if(division_rest != 10 && division_rest != 11){
                second_digit = division_rest;
            }

            identification.second_digit = second_digit.to_string();
        }

        public override string get_identification_formmated(){
            var cnpj_formmated = new StringBuilder();
            cnpj_formmated.append(get_identification());
            cnpj_formmated.insert(8,"-");
            return cnpj_formmated.str;
        }
    }
}
