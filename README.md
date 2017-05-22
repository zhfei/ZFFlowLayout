# ZFFlowLayout 流水布局
<br>
通过继承UICollectionViewFlowLayout类，并重写方法：- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{}方法,然后改变UICollectionViewFlowLayout类的布局方案。最后实现效果如下：
<br><br>

![截图](https://github.com/zhfei/MyTestWorkProduct/blob/master/MyTestWorkProduct/Assets.xcassets/LeftAligen.imageset/LeftAligen.png)
<br><br>

主要逻辑代码如下：
<br><br>
![截图](https://github.com/zhfei/MyTestWorkProduct/blob/master/MyTestWorkProduct/Assets.xcassets/LeftAligenCode.imageset/LeftAligenCode.png)

