namespace Identifications {
    public class IdentificationIeMg : Identification {
        public IdentificationIeMg () {
            generate_first_part();
            generate_first_digit();
            generate_second_digit();
         }

        protected override void generate_first_part(){
            for(int i = 0; i < 11; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }

        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var peso_one = 1;
            var peso_two = 2;

            StringBuilder identification_equals = new StringBuilder();
            identification_equals.append(identification.core.to_string());
            identification_equals.insert(3,"0");

            for(int i = 0; i < identification_equals.str.length; i++){
                var product = 0;

                if(i % 2 == 0){
                    product = int.parse(identification_equals.str[i].to_string()) * peso_one;

                }else{
                    product = int.parse(identification_equals.str[i].to_string()) * peso_two;
                }

                if(product.to_string().length == 1){
                     sum_totaly += int.parse(product.to_string());
                }else{
                    sum_totaly += int.parse(product.to_string()[0].to_string()) + int.parse(product.to_string()[1].to_string());
                }
            }

            first_digit = 10 - (sum_totaly.to_string().length == 1 ? int.parse(sum_totaly.to_string()) : int.parse(sum_totaly.to_string()[1].to_string()));

            identification.first_digit = first_digit < 10 ? first_digit.to_string(): "0";
        }

        protected override void generate_second_digit(){
            var second_digit = 0;
            var sum_totaly = 0;
            var core_second_digit = identification.core.concat(identification.first_digit);
            var peso_one = 11;
            var peso_two = 3;
            var division_rest = 0;

            for(int i = 0; i < core_second_digit.length; i++){
                if(i < 2){
                    sum_totaly += int.parse(core_second_digit[i].to_string()) * peso_two;
                    peso_two--;
                }else{
                    sum_totaly += int.parse(core_second_digit[i].to_string()) * peso_one;
                    peso_one--;
                }
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
            cnpj_formmated.insert(9,"/");
            cnpj_formmated.insert(6,".");
            cnpj_formmated.insert(3,".");
            return cnpj_formmated.str;
        }
    }
}
