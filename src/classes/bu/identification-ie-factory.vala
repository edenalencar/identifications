using Gee;
namespace Identifications{
    public class  IdentificationIeFactory : GLib.Object {

        private Gee.Map<string,Identification> map = new HashMap<string, Identification> ();

        private IdentificationIeFactory () {
            map.set(Constants.CPF, new IdentificationCPF());
            map.set(Constants.CNPJ, new IdentificationCNPJ());
            map.set(Constants.IE_AC, new IdentificationIeAc());
            map.set(Constants.IE_AL, new IdentificationIeAl());
            map.set(Constants.IE_AM, new IdentificationIeAm());
            map.set(Constants.IE_AP, new IdentificationIeAp());
            map.set(Constants.IE_BA, new IdentificationIeBa());
            map.set(Constants.IE_CE, new IdentificationIeCe());
            map.set(Constants.IE_DF, new IdentificationIeDf());
            map.set(Constants.IE_ES, new IdentificationIeEs());
            map.set(Constants.IE_GO, new IdentificationIeGo());
            map.set(Constants.IE_MA, new IdentificationIeMa());
            map.set(Constants.IE_MS, new IdentificationIeMs());
            map.set(Constants.IE_MT, new IdentificationIeMt());
            map.set(Constants.IE_MG, new IdentificationIeMg());
            map.set(Constants.IE_PA, new IdentificationIePa());
            map.set(Constants.IE_PB, new IdentificationIePb());
            map.set(Constants.IE_PR, new IdentificationIePr());
            map.set(Constants.IE_PE, new IdentificationIePe());
            map.set(Constants.IE_PI, new IdentificationIePi());
            map.set(Constants.IE_RJ, new IdentificationIeRj());
            map.set(Constants.IE_RN, new IdentificationIeRn());
            map.set(Constants.IE_RS, new IdentificationIeRs());
            map.set(Constants.IE_RO, new IdentificationIeRo());
            map.set(Constants.IE_RR, new IdentificationIeRr());
            map.set(Constants.IE_SP, new IdentificationIeSp());
            map.set(Constants.IE_SC, new IdentificationIeSc());
            map.set(Constants.IE_SE, new IdentificationIeSe());
            map.set(Constants.IE_TO, new IdentificationIeTo());
        }

        public Identification get_identification(string identification_type){
            return map.get(identification_type);
        }

        public static IdentificationIeFactory get_instance(){
            return new IdentificationIeFactory();
        }
    }
}
