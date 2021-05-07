namespace Identifications {
    public class IdentificationIeSp : Identification {
            public IdentificationIeSp () {
                generate_first_part();
                generate_first_digit();
                generate_second_digit();
            }
            protected override void generate_first_part(){
                for(int i = 0; i < 8; i++ ){
                    identification.core += generate_random_number().to_string();
                }
            }

            protected override void generate_first_digit(){
                var first_digit = 0;
                var sum_totaly = 0;
                int[] peso = {1,3,4,5,6,7,8,10};


                for(int i = 0; i < identification.core.length; i++){
                    sum_totaly +=  int.parse(identification.core[i].to_string()) * peso[i];
                }

                var division_rest = sum_totaly % 11;

                first_digit = int.parse((division_rest.to_string()[division_rest.to_string().length - 1]).to_string());

                identification.first_digit = first_digit.to_string().concat("11");
            }

            protected override void generate_second_digit(){
                var second_digit = 0;
                var sum_totaly = 0;
                var core_second_digit = identification.core.concat(identification.first_digit);
                int[] peso = {3,2,10,9,8,7,6,5,4,3,2};
                var division_rest = 0;

                for(int i = 0; i < core_second_digit.length; i++){
                    sum_totaly += int.parse(core_second_digit[i].to_string()) * peso[i];
                }

                division_rest = sum_totaly % 11;

                second_digit = int.parse((division_rest.to_string()[division_rest.to_string().length - 1]).to_string());

                identification.second_digit = second_digit.to_string();
            }

            public override string get_identification_formmated(){
                var cnpj_formmated = new StringBuilder();
                cnpj_formmated.append(get_identification());
                cnpj_formmated.insert(9,".");
                cnpj_formmated.insert(6,".");
                cnpj_formmated.insert(3,".");
                return cnpj_formmated.str;
            }
        }
}
