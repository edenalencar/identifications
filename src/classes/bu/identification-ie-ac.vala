namespace Identifications {
    public class IdentificationIeAc : Identification {

        public IdentificationIeAc(){
            generate_first_part();
            generate_first_digit();
            generate_second_digit();
        }

        protected override void generate_first_part(){
            identification.core = "01";

            for(int i = 0; i < 9 ; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }

        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var division_rest = 0;

            for(int i = 0; i < identification.core.length; i++){
                if(i == 0 || i == 8){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 4;
                }else if(i == 1 || i == 9){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 3;
                }else if(i == 2 || i == 10){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 2;
                }else if(i == 3){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 9;
                }else if(i == 4){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 8;
                }else if(i == 5){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 7;
                }else if(i == 6){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 6;
                }else if(i == 7){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 5;
                }
            }

            division_rest = (sum_totaly % 11);
            var calc_first_digit = 11 - division_rest;

            if(calc_first_digit != 10 && calc_first_digit != 11){
                first_digit = calc_first_digit;
            }

            identification.first_digit = first_digit.to_string();
        }

        protected override void generate_second_digit(){
            var second_digit = 0;
            var sum_totaly = 0;
            var division_rest = 0;

            for(int i = 0; i < identification.core.length + identification.first_digit.length; i++){
                if(i == 0 || i == 8){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 5;
                }else if(i == 1 || i == 9){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 4;
                }else if(i == 2 || i == 10){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 3;
                }else if(i == 3){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 2;
                }else if(i == 4){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 9;
                }else if(i == 5){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 8;
                }else if(i == 6){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 7;
                }else if(i == 7){
                    sum_totaly += int.parse(identification.core[i].to_string()) * 6;
                }else if(i == 11){
                    sum_totaly += int.parse(identification.first_digit.to_string()) * 2;
                }
            }

            division_rest = (sum_totaly % 11);

            var calc_second_digit = 11 - division_rest;

            if(calc_second_digit != 10 && calc_second_digit != 11){
                second_digit = calc_second_digit;
            }

            identification.second_digit = second_digit.to_string();
        }

        public override string get_identification_formmated(){
            var cnpj_formmated = new StringBuilder();
            cnpj_formmated.append(get_identification());
            cnpj_formmated.insert(11,"-");
            cnpj_formmated.insert(8,"/");
            cnpj_formmated.insert(5,".");
            cnpj_formmated.insert(2,".");
            return cnpj_formmated.str;
        }

    }
}
