function [eps] = defineROI_Exploration(nantype)


names={'TMfast','TMslow','TMmid1','PostShort_{early}',...
    'PosShort_{late}','NegShort_{early}','NegShort_{late}','PosRamp',...
    'OGbase','TMbase','Adaptation_{early}','Adaptation_{mid}','Adaptation_{late}','Post1_{early}',...
    'Post1_{late}','Post2_{early}','Post2_{late}','Optimal','TMmid2_{early}','OG2_{early}'};


eps=defineEpochs(names,...
            {'TM fast','TM slow','TM mid 1','Pos Short',...
            'Pos Short','Neg Short','Neg Short','Pos short ramp',...
            'OG base','TM base','Adaptation','Adaptation','Adaptation','Post 1',...
            'Post 1','Post 2','Post 2','Split Pos 30','TM mid 2','OG 2'},...
            [-40 -40 -40 5,...
            -10 5 -10 -10,...
            -40 -40 5 40 -40 5,...
            -40 5 -40 -40 5 5],...
            [0 0 0 1,...
            0 1 0 0,...
            0 0 1 200 0 1,...
            0 1 0 0 1 1],...
            [5 5 5 0,...
            1 0 1 1,...
            5 5 0 0 5 0,...
            5 0 5 5 0 0],...
            nantype);