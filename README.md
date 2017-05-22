#### ZFFlowLayout 流水布局
<br>
流水布局的思路是：
通过UICollectionViewFlowLayout的代理方法 ：-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect 拿到UICollectionView元素的原始布局实例，然后按照想实现的效果修改原始的布局实例属性值。

<br><br>
首页如图所示
![首页](https://github.com/zhfei/ZFFlowLayout/blob/master/ZFFlowLayout/Src/EffectPicture/home.png)
<br><br>

左对齐流水布局如图所示
<br><br>
![左对齐流水布局](https://github.com/zhfei/ZFFlowLayout/blob/master/ZFFlowLayout/Src/EffectPicture/left.png)
<br><br>

右对齐流水布局如图所示
<br><br>
![右对齐流水布局](https://github.com/zhfei/ZFFlowLayout/blob/master/ZFFlowLayout/Src/EffectPicture/right.png)

