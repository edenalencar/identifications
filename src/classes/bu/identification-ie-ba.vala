namespace Identifications {
    public class IdentificationIeBa : Identification {
           public IdentificationIeBa () {
                    generate_first_part();
                    generate_second_digit();
                    generate_first_digit();
           }
             protected override void generate_first_part(){

                for(int i = 0; i < 6 ; i++ ){
                    identification.core += generate_random_number().to_string();
                }
            }

            protected override void generate_first_digit(){
                var first_digit = 0;
                var sum_totaly = 0;
                var division_rest = 0;
                var peso = 8;
                var core_second_digit = identification.core.concat(identification.second_digit);

                for(int i = 0; i < core_second_digit.length; i++){
                    sum_totaly += int.parse(core_second_digit[i].to_string()) * peso;
                    peso--;
                }

                 if(int.parse(identification.core[0].to_string()) == 6 ||
                    int.parse(identification.core[0].to_string()) == 7 ||
                    int.parse(identification.core[0].to_string()) == 9){

                    division_rest = sum_totaly % 11;
                    first_digit = (division_rest == 0 || division_rest == 1) ? 0 : 11 - division_rest;

                 }else{
                     division_rest = sum_totaly % 10;
                     first_digit = division_rest == 0 ? 0 : 10 - division_rest;
                 }

                identification.first_digit = first_digit.to_string();
            }

            protected override void generate_second_digit(){
                var second_digit = 0;
                var sum_totaly = 0;
                var division_rest = 0;
                var peso = 7;

                for(int i = 0; i < identification.core.length; i++){
                    sum_totaly += int.parse(identification.core[i].to_string()) * peso;
                    peso--;
                }

                if(int.parse(identification.core[0].to_string()) == 6 ||
                   int.parse(identification.core[0].to_string()) == 7 ||
                   int.parse(identification.core[0].to_string()) == 9){

                    division_rest = sum_totaly % 11;
                    second_digit = (division_rest == 0 || division_rest == 1) ? 0 : 11 - division_rest;

                }else{
                    division_rest = sum_totaly % 10;
                    second_digit = division_rest == 0 ? 0 : 10 - division_rest;
                }

                identification.second_digit = second_digit.to_string();
            }

            public override string get_identification_formmated(){
                var cnpj_formmated = new StringBuilder();
                cnpj_formmated.append(get_identification());
                cnpj_formmated.insert(6,"-");
                return cnpj_formmated.str;
            }
        }
}
