identifications_sources = [
  'classes/view/main.vala',
  'classes/view/window.vala',
  'classes/view/menu.vala',
  'classes/model/identification-model.vala',
  'classes/bu/identification.vala',
  'classes/bu/identification-ie-factory.vala',
  'classes/bu/identification-cpf.vala',
  'classes/bu/identification-cnpj.vala',
  'classes/bu/identification-ie-ac.vala',
  'classes/bu/identification-ie-al.vala',
  'classes/bu/identification-ie-am.vala',
  'classes/bu/identification-ie-ap.vala',
  'classes/bu/identification-ie-ba.vala',
  'classes/bu/identification-ie-ce.vala',
  'classes/bu/identification-ie-df.vala',
  'classes/bu/identification-ie-es.vala',
  'classes/bu/identification-ie-go.vala',
  'classes/bu/identification-ie-ma.vala',
  'classes/bu/identification-ie-ms.vala',
  'classes/bu/identification-ie-mt.vala',
  'classes/bu/identification-ie-mg.vala',
  'classes/bu/identification-ie-pa.vala',
  'classes/bu/identification-ie-pb.vala',
  'classes/bu/identification-ie-pr.vala',
  'classes/bu/identification-ie-pe.vala',
  'classes/bu/identification-ie-pi.vala',
  'classes/bu/identification-ie-rj.vala',
  'classes/bu/identification-ie-rn.vala',
  'classes/bu/identification-ie-rs.vala',
  'classes/bu/identification-ie-ro.vala',
  'classes/bu/identification-ie-rr.vala',
  'classes/bu/identification-ie-sp.vala',
  'classes/bu/identification-ie-sc.vala',
  'classes/bu/identification-ie-se.vala',
  'classes/bu/identification-ie-to.vala',
   app_constants
]

identifications_sources += gnome.compile_resources('identifications-resources',
  'identifications.gresource.xml',
  c_name: 'identifications'
)

identifications_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('gee-0.8')
]

executable('identifications', identifications_sources,
  vala_args: '--target-glib=2.50',  dependencies: identifications_deps,
  install: true,
)
