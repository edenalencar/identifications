namespace Identifications{
    public abstract class Identification : GLib.Object{
       public IdentificationModel identification = new IdentificationModel();

       public string get_identification(){
           return identification.core + identification.branche + identification.first_digit + identification.second_digit;
       }

       protected int generate_random_number(){
            return Random.int_range(0,10);
       }

       protected abstract void generate_first_part();
       protected abstract void generate_first_digit();
       protected virtual  void generate_second_digit(){}
       public virtual  void generate_branches(){}
       public abstract string get_identification_formmated();
    }
}
