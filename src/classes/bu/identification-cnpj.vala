using Gee;
namespace Identifications{
    public class IdentificationCNPJ : Identification {

            public IdentificationCNPJ () {
                generate_first_part();
                generate_branches();
                generate_first_digit();
                generate_second_digit();
            }

            public IdentificationCNPJ.With_Branches(string core, string branche){
                identification.core = core;
                identification.branche = branche;
                generate_branches();
                generate_first_digit();
                generate_second_digit();
            }

            protected override void generate_first_part(){
                for(int i = 0; i < 8 ; i++ ){
                    identification.core += generate_random_number().to_string();
                }
            }

             public override void generate_branches(){
                if(identification.branche == ""){
                    identification.branche = "0001";

                } else{
                    var branche = int.parse(identification.branche);
                    branche++;
                    identification.branche = branche.to_string().nfill(4 - branche.to_string().length,'0') + branche.to_string();
                }

             }

            protected override void generate_first_digit(){
                var first_digit = 0;
                var sum_totaly = 0;
                var division_rest = 0;
                var core_branche = identification.core.concat(identification.branche);

                for(int i = 0; i < core_branche.length; i++){
                    if(i == 0 || i == 8){
                        sum_totaly += int.parse(core_branche[i].to_string()) * 5;
                    }else if(i == 1 || i == 9){
                        sum_totaly += int.parse(core_branche[i].to_string()) * 4;
                    }else if(i == 2 || i == 10){
                        sum_totaly += int.parse(core_branche[i].to_string()) * 3;
                    }else if(i == 3 || i == 11){
                        sum_totaly += int.parse(core_branche[i].to_string()) * 2;
                    }else if(i == 4){
                        sum_totaly += int.parse(core_branche[i].to_string()) * 9;
                    }else if(i == 5){
                        sum_totaly += int.parse(core_branche[i].to_string()) * 8;
                    }else if(i == 6){
                        sum_totaly += int.parse(core_branche[i].to_string()) * 7;
                    }else if(i == 7){
                        sum_totaly += int.parse(core_branche[i].to_string()) * 6;
                    }
                }

                division_rest = (sum_totaly % 11);

                if(division_rest >= 2){
                    first_digit = 11 - division_rest;
                }

                 identification.first_digit = first_digit.to_string();
            }

            protected override void generate_second_digit(){
                var second_digit = 0;
                var sum_totaly = 0;
                var division_rest = 0;

                var core_first_digit = identification.core.concat(identification.branche).concat(identification.first_digit);

                for(int i = 0; i < core_first_digit.length; i++){
                    if(i == 0 || i == 8){
                        sum_totaly += int.parse(core_first_digit[i].to_string()) * 6;
                    }else if(i == 1 || i == 9){
                        sum_totaly += int.parse(core_first_digit[i].to_string()) * 5;
                    }else if(i == 2 || i == 10){
                        sum_totaly += int.parse(core_first_digit[i].to_string()) * 4;
                    }else if(i == 3 || i == 11){
                        sum_totaly += int.parse(core_first_digit[i].to_string()) * 3;
                    }else if(i == 4 || i == 12){
                        sum_totaly += int.parse(core_first_digit[i].to_string()) * 2;
                    }else if(i == 5){
                        sum_totaly += int.parse(core_first_digit[i].to_string()) * 9;
                    }else if(i == 6){
                        sum_totaly += int.parse(core_first_digit[i].to_string()) * 8;
                    }else if(i == 7){
                        sum_totaly += int.parse(core_first_digit[i].to_string()) * 7;
                    }
                }

                division_rest = (sum_totaly % 11);

                if(division_rest >= 2){
                    second_digit = 11 - division_rest;
                }

                identification.second_digit = second_digit.to_string();
            }

            public override string get_identification_formmated(){
                var cnpj_formmated = new StringBuilder();
                cnpj_formmated.append(get_identification());
                cnpj_formmated.insert(12,"-");
                cnpj_formmated.insert(8,"/");
                cnpj_formmated.insert(5,".");
                cnpj_formmated.insert(2,".");
                return cnpj_formmated.str;
            }
        }
}
