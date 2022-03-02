Deface::Override.new(virtual_path: 'spree/admin/shared/_product_tabs',
                     name: 'add_qa_link',
                     insert_bottom: '[data-hook="admin_product_tabs"]',
                     partial: 'spree/admin/shared/additional_product_tabs')

Spree::Backend::Config.menu_items.find{|item| item.label == :products}.sections << :questions

Deface::Override.new(virtual_path: 'spree/admin/shared/_product_sub_menu',
                     name: "add_qa_tab",
                     insert_bottom: "[data-hook='admin_product_sub_tabs']",
                     partial: 'spree/admin/shared/additional_product_sub_menu')
