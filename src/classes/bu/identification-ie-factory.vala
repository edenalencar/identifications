using Gee;
namespace Identifications{
    public class  IdentificationIeFactory : GLib.Object {

        private Gee.Map<string,Identification> map = new HashMap<string, Identification> ();

        private IdentificationIeFactory () {
            map.set("AC", new IdentificationIeAc());
            map.set("AL", new IdentificationIeAl());
            map.set("AM", new IdentificationIeAm());
            map.set("AP", new IdentificationIeAp());
            map.set("BA", new IdentificationIeBa());
            map.set("CE", new IdentificationIeCe());
            map.set("DF", new IdentificationIeDf());
            map.set("ES", new IdentificationIeEs());
            map.set("GO", new IdentificationIeGo());
            map.set("MA", new IdentificationIeMa());
            map.set("MS", new IdentificationIeMs());
            map.set("MT", new IdentificationIeMt());
            map.set("MG", new IdentificationIeMg());
            map.set("PA", new IdentificationIePa());
            map.set("PB", new IdentificationIePb());
            map.set("PR", new IdentificationIePr());
            map.set("PE", new IdentificationIePe());
            map.set("PI", new IdentificationIePi());
            map.set("RJ", new IdentificationIeRj());
            map.set("RN", new IdentificationIeRn());
            map.set("RS", new IdentificationIeRs());
            map.set("RO", new IdentificationIeRo());
            map.set("RR", new IdentificationIeRr());
            map.set("SP", new IdentificationIeSp());
            map.set("SC", new IdentificationIeSc());
            map.set("SE", new IdentificationIeSe());
            map.set("TO", new IdentificationIeTo());

        }

        public Identification get_identification(string state){
            return map.get(state);
        }

        public static IdentificationIeFactory get_instance(){
            return new IdentificationIeFactory();
        }
    }
}



