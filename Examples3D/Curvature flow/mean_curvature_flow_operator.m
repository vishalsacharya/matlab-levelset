%% Level set operator defining a PDE for mean curvature flow
% Implements the level set PDE for mean curvature flow used in the example:
% <curvature_flows.html curvature_flows.m>

function [dphi_dt,dt] = mean_curvature_flow_operator(ls, varargin)

% Assume that the alpha parameter is passed as an argument
alpha = varargin{1};

% Determine stable timestep for explicit time integration
dt = 0.9/(6*abs(alpha));

% Compute central differences and mean curvature
[Dx,Dy,Dz] = diff_central(ls);
k = mean_curvature(ls);

% Compute and return level set PDE (dphi_dt)
% Check for shocks/singularities (when curvature is Inf)
dphi_dt = alpha .* k .* sqrt(Dx.^2 + Dy.^2 + Dz.^2);
dphi_dt(isnan(k)) = 0;
