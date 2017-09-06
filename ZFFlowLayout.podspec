Pod::Spec.new do |spec|
  #名称
  spec.name         = "ZFFlowLayout"
  #版本号
  spec.version      = "1.0.0"
  #描述
  spec.summary      = "流水布局"
  #描述页面
  spec.homepage     = "http://www.baidu.com"
  #版权声明
  spec.license      = 'MIT'
  #作者
  spec.author       = { "zf" => "1174977961@qq.com" }
  #支持的系统
  spec.platform     = :ios, '8.0'

  #如果是开发版本,没有发布release版本,可以这样写 :commit => "e677206ce4f0dc5f96639621d920f71c53704246"
  spec.source       = { :path => "ZFFlowLayout.git"}

  #是否需要arc
  spec.requires_arc = true
  #源码 (swift写法: 路径/*.swift)
  #路径必须写对: 相对路径/**/*, **/*表示匹配子目录下的所有文件
  spec.source_files  = "ZFFlowLayout/Src/**/*.{h,m}"
  #源码 bundle文件
  spec.resource_bundles = {
    'ZFFlowLayout' => [
        'ZFFlowLayout/Src/**/*.{storyboard,xcassets,xib,png}'
    ]
  }
end
