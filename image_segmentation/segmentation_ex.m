%% 画像のセグメンテーション

img = 'skytree.jpg';
% J = im2double(imread(img));
J = imread(img);
I = imresize(J, 0.2);

figure
imshow(I)
Ilab = rgb2lab(I);     % 均等色空間
%% スーパーピクセルを用いた画像の分割

[Ls, N] = superpixels(Ilab, 1000, 'IsInputLab', true);
Bmask = boundarymask(Ls);         % ラベル境界をトレース(2値画像)
I1 = imoverlay(I, Bmask,'c');      % 画像中に、2値画像を指定色で上書き

figure;
imshow(I1); 
%% スーパーピクセル毎に平均値を算出し、その領域の色を置換, 表示

pixIdxList = label2idx(Ls);    % 各ラベル領域の行列インデックスを取得
sz = numel(Ls);                % 画素数
superLab = zeros(N,3);
for  i = 1:N    % 各スーパーピクセル毎に計算
  superLab(i,1) = mean(Ilab(pixIdxList{i}      ));  % L*成分平均値
  superLab(i,2) = mean(Ilab(pixIdxList{i}+   sz));  % a*成分平均値
  superLab(i,3) = mean(Ilab(pixIdxList{i}+ 2*sz));  % b*成分平均値
end
I2 = label2rgb(Ls, lab2rgb(superLab));

figure; 
imshowpair(I, imoverlay(I2, boundarymask(Ls),'c'), 'montage'); 
%% K-meansで色の類似度を用いたクラスタリング

numColors = 3;       
[idx, cLab] = kmeans(superLab, numColors);
Lc = zeros(size(Ls));
for i = 1:N                        % 各スーパーピクセル領域に
    Lc(pixIdxList{i}) = idx(i);    % インデックス番号(1～numColors)を書込み
end

I3  = label2rgb(Lc, lab2rgb(cLab)); % ラベル画像をRGB画像に変換
I3b = imoverlay(I3, boundarymask(Lc), 'm');      % 画像中に、2値画像を指定色で上書き

figure;
imshow(I3b); 
%% 建物の部分を抽出

maskA = (Lc == 1);
%% 
% マスクの生成･結果の表示

maskA_filled = imfill(maskA, 'holes');       % マスクの穴を埋める
Iout = imoverlay(I, maskA_filled, 'w');

figure; 
imshowpair(I, Iout);