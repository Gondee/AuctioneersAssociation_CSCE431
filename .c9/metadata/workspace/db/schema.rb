{"filter":false,"title":"schema.rb","tooltip":"/db/schema.rb","undoManager":{"mark":1,"position":1,"stack":[[{"group":"doc","deltas":[{"start":{"row":23,"column":0},"end":{"row":24,"column":0},"action":"insert","lines":["  add_index \"continueedus\", [\"member_id\", \"created_at\"], name: \"index_continueedus_on_member_id_and_created_at\"",""]},{"start":{"row":59,"column":0},"end":{"row":60,"column":0},"action":"insert","lines":["  add_index \"pacs\", [\"member_id\", \"created_at\"], name: \"index_pacs_on_member_id_and_created_at\"",""]},{"start":{"row":71,"column":0},"end":{"row":72,"column":0},"action":"insert","lines":["  add_index \"payments\", [\"member_id\", \"created_at\"], name: \"index_payments_on_member_id_and_created_at\"",""]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":43},"end":{"row":13,"column":44},"action":"remove","lines":["1"]},{"start":{"row":13,"column":43},"end":{"row":13,"column":44},"action":"insert","lines":["2"]},{"start":{"row":13,"column":46},"end":{"row":13,"column":50},"action":"remove","lines":["8290"]},{"start":{"row":13,"column":46},"end":{"row":13,"column":50},"action":"insert","lines":["7233"]},{"start":{"row":47,"column":45},"end":{"row":47,"column":61},"action":"insert","lines":["                "]},{"start":{"row":48,"column":45},"end":{"row":48,"column":49},"action":"insert","lines":["    "]},{"start":{"row":48,"column":49},"end":{"row":48,"column":61},"action":"insert","lines":["            "]},{"start":{"row":50,"column":0},"end":{"row":53,"column":0},"action":"insert","lines":["    t.boolean  \"admin\",                      default: false","    t.string   \"reset_digest\"","    t.datetime \"reset_sent_at\"",""]}]}]]},"ace":{"folds":[],"scrolltop":120,"scrollleft":0,"selection":{"start":{"row":22,"column":0},"end":{"row":22,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":7,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1429230509000,"hash":"b802ee714603674dfcd6d62b3bf22f8780a45e47"}