namespace Identifications{
    public class IdentificationCPF : Identification {

        public IdentificationCPF () {
            generate_first_part();
            generate_first_digit();
            generate_second_digit();
        }

        protected override void generate_first_part(){
            for(int i = 0; i < 9 ; i++ ){
                identification.core += generate_random_number().to_string();
            }
        }
        protected override void generate_first_digit(){
            var first_digit = 0;
            var sum_totaly = 0;
            var division_rest = 0;
            var peso = 10;

             for(int i = 0; i <  identification.core.length; i++){
                sum_totaly +=  int.parse(identification.core[i].to_string()) * peso;
                peso--;
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
            var peso = 11;
            var core_first_digit = identification.core.concat(identification.first_digit);

            for(int i = 0; i <  core_first_digit.length; i++){
                sum_totaly +=  int.parse(core_first_digit[i].to_string()) * peso;
                peso--;
            }

            division_rest = (sum_totaly % 11);

            if(division_rest >= 2){
                second_digit = 11 - division_rest;
            }

            identification.second_digit = second_digit.to_string();

        }
        public override string get_identification_formmated(){
            var cpf_formmated = new StringBuilder();
            cpf_formmated.append(get_identification());
            cpf_formmated.insert(9,"-");
            cpf_formmated.insert(6,".");
            cpf_formmated.insert(3,".");
            return cpf_formmated.str;
        }
    }
}
