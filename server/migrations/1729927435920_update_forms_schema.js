exports.up=function(n){return n.schema.table("forms",(function(n){n.dropColumn("sectionCount")})).table("form_sections",(function(n){n.dropColumn("index")}))},exports.down=function(n){return n.schema.table("forms",(function(n){n.integer("sectionCount").defaultTo(0)})).table("form_sections",(function(n){n.integer("index")}))};