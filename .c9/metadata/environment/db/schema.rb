{"filter":false,"title":"schema.rb","tooltip":"/db/schema.rb","undoManager":{"mark":0,"position":0,"stack":[[{"start":{"row":12,"column":46},"end":{"row":12,"column":47},"action":"remove","lines":["5"],"id":2},{"start":{"row":12,"column":46},"end":{"row":12,"column":47},"action":"insert","lines":["6"]},{"start":{"row":12,"column":49},"end":{"row":12,"column":51},"action":"insert","lines":["63"]},{"start":{"row":12,"column":53},"end":{"row":12,"column":56},"action":"remove","lines":["724"]},{"start":{"row":12,"column":53},"end":{"row":12,"column":54},"action":"insert","lines":["8"]},{"start":{"row":15,"column":28},"end":{"row":36,"column":5},"action":"insert","lines":["","","  create_table \"active_storage_attachments\", force: :cascade do |t|","    t.string \"name\", null: false","    t.string \"record_type\", null: false","    t.bigint \"record_id\", null: false","    t.bigint \"blob_id\", null: false","    t.datetime \"created_at\", null: false","    t.index [\"blob_id\"], name: \"index_active_storage_attachments_on_blob_id\"","    t.index [\"record_type\", \"record_id\", \"name\", \"blob_id\"], name: \"index_active_storage_attachments_uniqueness\", unique: true","  end","","  create_table \"active_storage_blobs\", force: :cascade do |t|","    t.string \"key\", null: false","    t.string \"filename\", null: false","    t.string \"content_type\"","    t.text \"metadata\"","    t.bigint \"byte_size\", null: false","    t.string \"checksum\", null: false","    t.datetime \"created_at\", null: false","    t.index [\"key\"], name: \"index_active_storage_blobs_on_key\", unique: true","  end"]},{"start":{"row":88,"column":0},"end":{"row":89,"column":89},"action":"insert","lines":["","  add_foreign_key \"active_storage_attachments\", \"active_storage_blobs\", column: \"blob_id\""]}]]},"ace":{"folds":[],"scrolltop":531.5,"scrollleft":0,"selection":{"start":{"row":37,"column":0},"end":{"row":37,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":35,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1576479537668,"hash":"1a32210b239183f465252d80d67d2ec8f62eb0d1"}