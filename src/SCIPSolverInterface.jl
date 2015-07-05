# Implements the MathProgBase.jl interface
importall MathProgBase.SolverInterface

export SCIPMathProgModel, SCIPSolver


type SCIPMathProgModel <: AbstractMathProgModel
    ptr::SPtr{_SCIP}
    vars::Vector{SPtr{_SCIP_VAR}}
    etaidx::Int
    objcons  #::SPtr{_SCIP_CONS}
end
function SCIPMathProgModel(;options...)
    # TODO: Pass options
    scip = SCIPcreate()
    _SCIPcreateProbBasic(scip, "")
    _SCIPincludeDefaultPlugins(scip)
    SCIPMathProgModel(scip,SPtr{_SCIP_VAR}[])
end


immutable SCIPSolver <: AbstractMathProgSolver
    options
end
SCIPSolver(;kwargs...) = SCIPSolver(kwargs)

######################################################################
# LOW LEVEL INTERFACE
######################################################################

model(s::SCIPSolver) = SCIPMathProgModel(;s.options...)

#loadproblem!(model::SCIPMathProgModel, filename::String)

function loadproblem!(model::SCIPMathProgModel, A::Union(SparseMatrixCSC,Matrix), l::Vector, u::Vector, c::Vector, lb::Vector, ub::Vector, sense::Symbol)
    A = sparse(A)
    m, n = size(A)
    setsense!(model, sense)
    for i in 1:n
        addvar!(model, l[i], u[i], c[i])
    end
    At = A'
    for i in 1:length(At.colptr)-1
        r, s = At.colptr[i], At.colptr[i+1]
        r == s && continue
        addconstr!(model, At.rowval[r:(s-1)], At.nzval[r:(s-1)], lb[i], ub[i])
    end
    nothing
end

#writeproblem(model::SCIPMathProgModel)

getvarLB(m::SCIPMathProgModel) = [_SCIPvarGetLbOriginal(m.vars[i]) for i in 1:numvar(m)]
#function setvarLB!(m::SCIPMathProgModel, lb)
    #for i in 1:numvar(m)
    # NOT WRAPPED?
    #    ret = _SCIPvarChgLbOriginal(m.vars[i], ,lb[i])
#end
getvarUB(m::SCIPMathProgModel) = [_SCIPvarGetUbOriginal(m.vars[i]) for i in 1:numvar(m)]
#function setvarUB!

#getconstrLB(m::SCIPMathProgModel)
#setconstrLB!(m::SCIPMathProgModel,lb)
#getconstrUB(m::SCIPMathProgModel)
#setconstrUB!(m::SCIPMathProgModel,lb)

getobj(m::SCIPMathProgModel) = [_SCIPvarGetObj(m.vars[i]) for i in 1:numvar(m)]
function setobj!(m::SCIPMathProgModel, c)
    numvar(m) == length(c) ||
        throw(ArgumentError("Length of new objective vector is different from number of variables!"))
    for i in 1:numvar(m)
        _SCIPchgVarObj(m.ptr, m.vars[i], convert(_SCIP_Real,c[i]))
    end
    nothing
end

#getconstrmatrix(m::SCIPMathProgModel)

#addvar!(m::SCIPMathProgModel, constridx, constrcoef, l, u, coeff)
function addvar!(m::SCIPMathProgModel, l, u, coeff)
    var = SCIPcreateVarBasic(m.ptr, l, u, coeff, SCIP._SCIP_VARTYPE_CONTINUOUS)
    _SCIPaddVar(m.ptr, var)
    push!(m.vars, var)
    return numvar(m)
end

function addconstr!(m::SCIPMathProgModel, varidx, coeff, lb, ub)
    cons = SCIPcreateConsBasicLinear(m.ptr, m.vars[varidx],
                                            convert(Vector{_SCIP_Real},coeff),
                                            convert(_SCIP_Real,lb),
                                            convert(_SCIP_Real,ub))
    _SCIPaddCons(m.ptr, cons)
    nothing
end

#updatemodel!(m::SCIPMathProgModel)

const obj_sense_map = [
    :Max => _SCIP_OBJSENSE_MAXIMIZE,
    :Min => _SCIP_OBJSENSE_MINIMIZE
]
setsense!(m::SCIPMathProgModel, sense::Symbol) = _SCIPsetObjsense(m.ptr, obj_sense_map[sense])
function getsense(m::SCIPMathProgModel)
    _SCIPgetObjsense(m.ptr) == _SCIP_OBJSENSE_MAXIMIZE ? :Max : :Min
end

numvar(m::SCIPMathProgModel) = length(m.vars)
numconstr(m::SCIPMathProgModel) = _SCIPgetNOrigConss(m.ptr)
#numlinconstr

function optimize!(m::SCIPMathProgModel)
    ret = _SCIPsolve(m.ptr)
    ret == _SCIP_OKAY || throw(SCIPError(ret))
    nothing
end

const sol_stat_map = [
    _SCIP_STATUS_UNKNOWN  => :Error,
    _SCIP_STATUS_USERINTERRUPT  => :Error,
    _SCIP_STATUS_NODELIMIT => :UserLimit,
    _SCIP_STATUS_TOTALNODELIMIT => :UserLimit,
    _SCIP_STATUS_STALLNODELIMIT => :UserLimit,
    _SCIP_STATUS_TIMELIMIT => :UserLimit ,
    _SCIP_STATUS_MEMLIMIT => :UserLimit,
    _SCIP_STATUS_GAPLIMIT => :UserLimit,
    _SCIP_STATUS_SOLLIMIT => :UserLimit,
    _SCIP_STATUS_BESTSOLLIMIT  => :UserLimit,
    _SCIP_STATUS_OPTIMAL => :Optimal,
    _SCIP_STATUS_INFEASIBLE => :Infeasible,
    _SCIP_STATUS_UNBOUNDED => :Unbounded,
    _SCIP_STATUS_INFORUNBD => :InfOrUnbounded
]
status(m::SCIPMathProgModel) = sol_stat_map[_SCIPgetStatus(m.ptr)]

getobjval(m::SCIPMathProgModel) = _SCIPgetPrimalbound(m.ptr)

getobjbound(m::SCIPMathProgModel) = _SCIPgetDualbound(m.ptr)

function getsolution(m::SCIPMathProgModel)
    #sol  = SPtr(_SCIP_SOL)
    sol = _SCIPgetBestSol(m.ptr)
    solval = [_SCIPgetSolVal(m.ptr, sol, m.vars[i]) for i in 1:numvar(m)]
    if m.etaidx == 0
        return solval
    else # return only original variables
        deleteat!(solval, m.etaidx)
        return solval
    end
end

#getconstrsolution(m::SCIPMathProgModel)
#getreducedcosts(m::SCIPMathProgModel)
#getconstrduals(m::SCIPMathProgModel)
#getinfeasibilityray(m::SCIPMathProgModel)
#getbasis(m::SCIPMathProgModel)
#getunboundedray(m::SCIPMathProgModel)
#getsolvetime(m::SCIPMathProgModel)
#getsimplexiter(m::SCIPMathProgModel)
#getbarrieriter(m::SCIPMathProgModel)
#getobjgap(m::SCIPMathProgModel)

getrawsolver(m::SCIPMathProgModel) = m.ptr

#setwarmstart!(m::SCIPMathProgModel,v)

######################################################################
# INTEGER PROGRAMMING INTERFACE
######################################################################

#getnodecount(m::SCIPMathProgModel)

const var_type_map = [
    :Bin => _SCIP_VARTYPE_BINARY,
    :Cont => _SCIP_VARTYPE_CONTINUOUS,
    :Int => _SCIP_VARTYPE_INTEGER,
    :ImpliedInt => _SCIP_VARTYPE_IMPLINT
]
function setvartype!(m::SCIPMathProgModel, v::Vector{Symbol})
    numvar(m) == length(v) ||
        throw(ArgumentError("Length of new variable type vector is different from number of variables!"))
    for i in 1:numvar(m)
        _SCIPchgVarType(m.ptr, m.vars[i], var_type_map[v[i]], Array(_SCIP_Bool,1))
    end
    nothing
end
getvartype(m::SCIPMathProgModel) = [_SCIPvarGetType(m.vars[i]) for i in 1:numvar(m)]

#addsos1!
#addsos2!

######################################################################
# QUADRATIC PROGRAMMING INTERFACE
######################################################################

function addquadconstr!(m::SCIPMathProgModel, linidx, linval, quadrowidx, quadcolidx, quadval, sense, rhs)
    lb = - _SCIPinfinity(m.ptr)
    ub = _SCIPinfinity(m.ptr)
    if sense == '<'
        ub = rhs
    elseif sense == '>'
        lb = rhs
    elseif sense == '='
        lb = rhs
        ub = rhs
    else
        error("Sense not recognized.")
    end

    cons = SCIPcreateConsBasicQuadratic(m.ptr, m.vars[linidx],
                                            linval,
                                            m.vars[quadrowidx],
                                            m.vars[quadcolidx],
                                            quadval,
                                            lb, ub)
    _SCIPaddCons(m.ptr, cons)
    nothing
end

function setquadobj!(m::SCIPMathProgModel, rowidx, colidx, quadval)
    if getsense(m) == :Min  # Min: eta - x'Qx >= 0
        lb = 0
        ub = _SCIPinfinity(m.ptr)
    else # Max: eta - 1/2x'Qx <= 0
        ub = 0
        lb = _SCIPinfinity(m.ptr)
    end

    ((n = length(rowidx)) == length(colidx) == length(quadval)) || error("Inconsistent argument dimensions.")
    quadcoef = quadval
    for i = 1:n
        if rowidx[i] == colidx[i]
           quadcoef[i]/=2
        end
    end

   if m.etaidx == 0
      addvar!(m, -_SCIPinfinity(m.ptr), _SCIPinfinity(m.ptr), 1)
      m.etaidx = length(m.vars)
   end
    if m.objcons != nothing
       _SCIPdelCons(m.ptr, m.objcons)
   end
    m.objcons = SCIPcreateConsBasicQuadratic(m.ptr, [m.vars[m.etaidx]],
    [1],
    m.vars[rowidx],
    m.vars[colidx],
    - quadcoef,
    0, Inf)
    _SCIPaddCons(m.ptr, m.objcons)
    nothing
end

######################################################################
# CALLBACK INTERFACE
######################################################################

# ...
