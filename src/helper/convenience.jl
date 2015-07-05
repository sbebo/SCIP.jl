export SCIPcreate, SCIPcreateVarBasic, SCIPcreateConsBasicLinear, SCIPcreateConsBasicQuadratic

# Convenience constructors/destructors
function SCIPcreate()
    # scip = pointer(Array(Ptr{_SCIP}, 1))
    scip = SPtr(_SCIP)
    _SCIPcreate(pointer(scip))
    finalizer(scip, scip->_SCIPfree(pointer(scip)))
    return scip
end

SCIPcreateVarBasic(scip::SPtr{_SCIP},lb,ub,obj,vartype::_SCIP_VARTYPE) = 
    SCIPcreateVarBasic(scip,"",lb,ub,obj,vartype)

function SCIPcreateVarBasic(scip::SPtr{_SCIP}, name::String, lb, ub, obj, vartype::_SCIP_VARTYPE)
    var = SPtr(_SCIP_VAR)
    _SCIPcreateVarBasic(scip, pointer(var), name, convert(_SCIP_Real,lb), convert(_SCIP_Real,ub), convert(_SCIP_Real,obj), vartype)
    # finalizer(var, var->_SCIPreleaseVar(scip, var))
    return var
end

SCIPcreateConsBasicLinear(scip::SPtr{_SCIP}, vars::Vector{SPtr{_SCIP_VAR}}, vals, lhs, rhs) = 
    SCIPcreateConsBasicLinear(scip, "", vars, vals, lhs, rhs)
function SCIPcreateConsBasicLinear(scip::SPtr{_SCIP}, name::String, vars::Vector{SPtr{_SCIP_VAR}}, vals, lhs, rhs)
    nvars = length(vars)
    @assert length(vals) == nvars
    cons = SPtr(_SCIP_CONS)
    _SCIPcreateConsBasicLinear(scip, 
                               pointer(cons), 
                               name, 
                               nvars, 
                               pointer(vars), 
                               # pointer(vv),
                               convert(Vector{_SCIP_Real},vals), 
                               convert(_SCIP_Real,lhs), 
                               convert(_SCIP_Real,rhs))
    # finalizer(cons, cons->_SCIPreleaseCons(scip, cons))
    return cons
end


SCIPcreateConsBasicQuadratic(scip::SPtr{_SCIP}, linvars::Vector{SPtr{_SCIP_VAR}}, linvals, quadvars1::Vector{SPtr{_SCIP_VAR}}, quadvars2::Vector{SPtr{_SCIP_VAR}}, quadvals, lhs, rhs) = 
    SCIPcreateConsBasicQuadratic(scip, "", linvars, linvals, quadvars1, quadvars2, quadvals, lhs, rhs)
function SCIPcreateConsBasicQuadratic(scip::SPtr{_SCIP}, name::String, linvars, linvals, quadvars1::Vector{SPtr{_SCIP_VAR}}, quadvars2::Vector{SPtr{_SCIP_VAR}}, quadvals, lhs, rhs)
    nlinvars = length(linvars)
    nquadterms = length(quadvars1)
    @assert length(linvals) == nlinvars
    @assert length(quadvals) == length(quadvars2) == nquadterms

    cons = SPtr(_SCIP_CONS)
    _SCIPcreateConsBasicQuadratic(scip, 
                               pointer(cons), 
                               name, 
                               nlinvars, 
                               pointer(linvars), 
                               convert(Vector{_SCIP_Real},linvals),
                               nquadterms, 
                               pointer(quadvars1),
                               pointer(quadvars2),
                               convert(Vector{_SCIP_Real},quadvals),
                               convert(_SCIP_Real,lhs), 
                               convert(_SCIP_Real,rhs))
    return cons
end
