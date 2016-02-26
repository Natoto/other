// defineClass(“类名”, {实例方法:jsFunction, 实例方法:jsFunction, ...}, {类方法:jsFunction, 类方法:jsFunction, ...});
defineClass('AttentionViewController',
            {
            viewDidLoad: function() {
            
//            self.ORIGviewDidLoad();
            
            var label = require('UILabel').alloc().initWithFrame({x:70, y:170, width:200, height:150});
            label.setText("刚刚修改了一个巨大的错误，来自hotfix！");
            label.setNumberOfLines(0);
            label.setTextColor(require('UIColor').redColor());
            label.setBackgroundColor(require('UIColor').blueColor());
            self.view().addSubview(label);
            
            label.mas__makeConstraints(block('MASConstraintMaker*', function(make) {
                                             
                                             make.leading().equalTo()(self.view()).offset()(40);
                                             make.trailing().equalTo()(self.view()).offset()(-40);
                                             make.top().equalTo()(self.view()).offset()(170);
                                             //                                            make.height().equalTo()(self.view()).multipliedBy()(0.3);
                                             make.height().mas__equalTo()(300);
                                             }));
            },
            
//            handleBtn: function(sender) {
//            
//            var tableViewCtrl = JPTableViewController.alloc().init()
//            self.navigationController().pushViewController_animated(tableViewCtrl, YES)
//            }
            },
            
            
            
            {
            load: function() {
            
            self.ORIGload();
            }
            
            }
            )

