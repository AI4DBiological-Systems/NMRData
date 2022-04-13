
### replace this with SQL later.
# function getexperimentpath(tag::String)
#     repo_path = pwd()
#     base_path = ""
#     experiment_name = ""
#
#     if tag[1:3] == "NRC"
#         base_path = "experiments/NRC"
#
#         if tag == "NRC_Glucose_2018"
#             experiment_name = "glucose/Sep-25-2018"
#
#         elseif tag == "NRC_DMEM_2012"
#             experiment_name = "dmem_medium/Oct-22-2012"
#
#         elseif tag ==
#     end
#
#     return joinpath(repo_path, base_path, experiment_name)
# end


# function getpath(base_path::String, experiment_name::String)::String
#     #repo_path = pwd()
#     repo_path = dirname(pathof(@__MODULE__))

#     return joinpath(repo_path, base_path, experiment_name)
# end

"""
Currently available options for folder_name are: BMRB-500-0.5mM, BMRB-500-2mM, and BMRB-700.
"""
function getBMRBexperimentpaths(folder_name::String; join_flag = true)
    
    src_path = dirname(pathof(NMRData))
    exp_folder = "../combination/$(folder_name)"
    
    return readdir(joinpath(src_path, exp_folder); join = join_flag)
end

"""
Currently available options for folder_name are: BMRB-500-0.5mM, BMRB-500-2mM, and BMRB-700.
Run getBMRBexperimentpaths(folder_name) for a list of available compound names.
"""
function getBMRBexperimentpath(folder_name::String, name::String; join_flag = true)
    
    paths = getBMRBexperimentpaths(folder_name::String; join_flag = join_flag)
    filter!(xx->occursin(name,xx), paths)
    
    return paths
end