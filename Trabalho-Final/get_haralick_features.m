function features = get_haralick_features (glcm)
  glcm(1, :,:, :) = 0;
  glcm(:, 1,:, :) = 0;
  feat = [];
  for i = 1:4
	feat = [feat,haralickTextureFeatures(glcm(:, : , 1, i), 1:3)(:)];
  end
  features = [mean(feat(1,:))
			  mean(feat(2,:))
			  mean(feat(3,:))];
endfunction
