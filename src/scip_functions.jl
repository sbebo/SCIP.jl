type SCIPError# <: Exception
    msg::ASCIIString
    SCIPError(code::_SCIP_RETCODE) = new(SCIP_Retcode_MAP[code])
end

# Macro for calling SCIP functions that return misc. types
macro scip_ccall(func, args...)
    return quote
        ccall(($func, "libscipopt"), $(args...))
    end
end

# Macro for calling SCIP functions that have checked return codes
macro scip_ccall_check(func, args...)
    return quote
        ret = ccall(($func, "libscipopt"), _SCIP_RETCODE, $(args...))
        ret == _SCIP_OKAY || throw(SCIPError(ret))
    end
end

# SCIP function wrappers: unchecked functions

_SCIPcolSort(col::SCIP_COL_t) = @scip_ccall("SCIPcolSort", 
	Void, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetObj(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetObj", 
	_SCIP_Real, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetLb(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetLb", 
	_SCIP_Real, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetUb(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetUb", 
	_SCIP_Real, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetBestBound(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetBestBound", 
	_SCIP_Real, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetPrimsol(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetPrimsol", 
	_SCIP_Real, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetMinPrimsol(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetMinPrimsol", 
	_SCIP_Real, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetMaxPrimsol(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetMaxPrimsol", 
	_SCIP_Real, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetBasisStatus(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetBasisStatus", 
	_SCIP_BASESTAT, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetVar(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetIndex(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetIndex", 
	Int, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolIsIntegral(col::SCIP_COL_t) = @scip_ccall("SCIPcolIsIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolIsRemovable(col::SCIP_COL_t) = @scip_ccall("SCIPcolIsRemovable", 
	_SCIP_Bool, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetLPPos(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetLPPos", 
	Int, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetLPDepth(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetLPDepth", 
	Int, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolIsInLP(col::SCIP_COL_t) = @scip_ccall("SCIPcolIsInLP", 
	_SCIP_Bool, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetNNonz(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetNNonz", 
	Int, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetNLPNonz(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetNLPNonz", 
	Int, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetRows(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetRows", 
	Ptr{Ptr{_SCIP_ROW}}, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetVals(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetVals", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetStrongbranchNode(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetStrongbranchNode", 
	Int64, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPcolGetNStrongbranchs(col::SCIP_COL_t) = @scip_ccall("SCIPcolGetNStrongbranchs", 
	Int, 
	(Ptr{_SCIP_COL},), 
	pointer(col)
)
_SCIPboundtypeOpposite(boundtype::_SCIP_BOUNDTYPE) = @scip_ccall("SCIPboundtypeOpposite", 
	_SCIP_BOUNDTYPE, 
	(_SCIP_BOUNDTYPE,), 
	boundtype
)
_SCIProwLock(row::SCIP_ROW_t) = @scip_ccall("SCIProwLock", 
	Void, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwUnlock(row::SCIP_ROW_t) = @scip_ccall("SCIProwUnlock", 
	Void, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetScalarProduct(row1::SCIP_ROW_t, row2::SCIP_ROW_t) = @scip_ccall("SCIProwGetScalarProduct", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW}, Ptr{_SCIP_ROW}), 
	pointer(row1), pointer(row2)
)
_SCIProwGetParallelism(row1::SCIP_ROW_t, row2::SCIP_ROW_t, orthofunc::Char) = @scip_ccall("SCIProwGetParallelism", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW}, Ptr{_SCIP_ROW}, Char), 
	pointer(row1), pointer(row2), orthofunc
)
_SCIProwGetOrthogonality(row1::SCIP_ROW_t, row2::SCIP_ROW_t, orthofunc::Char) = @scip_ccall("SCIProwGetOrthogonality", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW}, Ptr{_SCIP_ROW}, Char), 
	pointer(row1), pointer(row2), orthofunc
)
_SCIProwSort(row::SCIP_ROW_t) = @scip_ccall("SCIProwSort", 
	Void, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetNNonz(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetNNonz", 
	Int, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetNLPNonz(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetNLPNonz", 
	Int, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetCols(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetCols", 
	Ptr{Ptr{_SCIP_COL}}, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetVals(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetVals", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetConstant(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetNorm(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetNorm", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetSumNorm(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetSumNorm", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetLhs(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetLhs", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetRhs(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetRhs", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetDualsol(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetDualsol", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetDualfarkas(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetDualfarkas", 
	_SCIP_Real, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetBasisStatus(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetBasisStatus", 
	_SCIP_BASESTAT, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetName(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetName", 
	String, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetIndex(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetIndex", 
	Int, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetAge(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetAge", 
	Int, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetRank(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetRank", 
	Int, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwIsIntegral(row::SCIP_ROW_t) = @scip_ccall("SCIProwIsIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwIsLocal(row::SCIP_ROW_t) = @scip_ccall("SCIProwIsLocal", 
	_SCIP_Bool, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwIsModifiable(row::SCIP_ROW_t) = @scip_ccall("SCIProwIsModifiable", 
	_SCIP_Bool, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwIsRemovable(row::SCIP_ROW_t) = @scip_ccall("SCIProwIsRemovable", 
	_SCIP_Bool, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetOrigintype(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetOrigintype", 
	_SCIP_ROWORIGINTYPE, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetOriginCons(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetOriginCons", 
	Ptr{_SCIP_CONSHDLR}, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetOriginSepa(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetOriginSepa", 
	Ptr{_SCIP_SEPA}, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwIsInGlobalCutpool(row::SCIP_ROW_t) = @scip_ccall("SCIProwIsInGlobalCutpool", 
	_SCIP_Bool, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetLPPos(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetLPPos", 
	Int, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwGetLPDepth(row::SCIP_ROW_t) = @scip_ccall("SCIProwGetLPDepth", 
	Int, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwIsInLP(row::SCIP_ROW_t) = @scip_ccall("SCIProwIsInLP", 
	_SCIP_Bool, 
	(Ptr{_SCIP_ROW},), 
	pointer(row)
)
_SCIProwChgRank(row::SCIP_ROW_t, rank::Int) = @scip_ccall("SCIProwChgRank", 
	Void, 
	(Ptr{_SCIP_ROW}, Int), 
	pointer(row), rank
)
_SCIPpricerGetData(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerGetData", 
	Ptr{_SCIP_PRICERDATA}, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerSetData(pricer::SCIP_PRICER_t, pricerdata::SCIP_PRICERDATA_t) = @scip_ccall("SCIPpricerSetData", 
	Void, 
	(Ptr{_SCIP_PRICER}, Ptr{_SCIP_PRICERDATA}), 
	pointer(pricer), pointer(pricerdata)
)
_SCIPpricerGetName(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerGetName", 
	String, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerGetDesc(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerGetDesc", 
	String, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerGetPriority(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerGetPriority", 
	Int, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerGetNCalls(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerGetNCalls", 
	Int, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerGetNVarsFound(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerGetNVarsFound", 
	Int, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerGetSetupTime(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerGetTime(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerIsActive(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerIsActive", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerIsDelayed(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerIsDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPpricerIsInitialized(pricer::SCIP_PRICER_t) = @scip_ccall("SCIPpricerIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PRICER},), 
	pointer(pricer)
)
_SCIPreaderGetData(reader::SCIP_READER_t) = @scip_ccall("SCIPreaderGetData", 
	Ptr{_SCIP_READERDATA}, 
	(Ptr{_SCIP_READER},), 
	pointer(reader)
)
_SCIPreaderSetData(reader::SCIP_READER_t, readerdata::SCIP_READERDATA_t) = @scip_ccall("SCIPreaderSetData", 
	Void, 
	(Ptr{_SCIP_READER}, Ptr{_SCIP_READERDATA}), 
	pointer(reader), pointer(readerdata)
)
_SCIPreaderGetName(reader::SCIP_READER_t) = @scip_ccall("SCIPreaderGetName", 
	String, 
	(Ptr{_SCIP_READER},), 
	pointer(reader)
)
_SCIPreaderGetDesc(reader::SCIP_READER_t) = @scip_ccall("SCIPreaderGetDesc", 
	String, 
	(Ptr{_SCIP_READER},), 
	pointer(reader)
)
_SCIPreaderGetExtension(reader::SCIP_READER_t) = @scip_ccall("SCIPreaderGetExtension", 
	String, 
	(Ptr{_SCIP_READER},), 
	pointer(reader)
)
_SCIPreaderCanRead(reader::SCIP_READER_t) = @scip_ccall("SCIPreaderCanRead", 
	_SCIP_Bool, 
	(Ptr{_SCIP_READER},), 
	pointer(reader)
)
_SCIPreaderCanWrite(reader::SCIP_READER_t) = @scip_ccall("SCIPreaderCanWrite", 
	_SCIP_Bool, 
	(Ptr{_SCIP_READER},), 
	pointer(reader)
)
_SCIPbranchruleGetData(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetData", 
	Ptr{_SCIP_BRANCHRULEDATA}, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleSetData(branchrule::SCIP_BRANCHRULE_t, branchruledata::SCIP_BRANCHRULEDATA_t) = @scip_ccall("SCIPbranchruleSetData", 
	Void, 
	(Ptr{_SCIP_BRANCHRULE}, Ptr{_SCIP_BRANCHRULEDATA}), 
	pointer(branchrule), pointer(branchruledata)
)
_SCIPbranchruleGetName(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetName", 
	String, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetDesc(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetDesc", 
	String, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetPriority(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetPriority", 
	Int, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetMaxdepth(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetMaxdepth", 
	Int, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetMaxbounddist(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetMaxbounddist", 
	_SCIP_Real, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetSetupTime(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetTime(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetNLPCalls(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetNLPCalls", 
	Int64, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetNExternCalls(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetNExternCalls", 
	Int64, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetNPseudoCalls(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetNPseudoCalls", 
	Int64, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetNCutoffs(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetNCutoffs", 
	Int64, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetNCutsFound(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetNCutsFound", 
	Int64, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetNConssFound(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetNConssFound", 
	Int64, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetNDomredsFound(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetNDomredsFound", 
	Int64, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleGetNChildren(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleGetNChildren", 
	Int64, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPbranchruleIsInitialized(branchrule::SCIP_BRANCHRULE_t) = @scip_ccall("SCIPbranchruleIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BRANCHRULE},), 
	pointer(branchrule)
)
_SCIPgetLhsVarbound(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsVarbound", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsVarbound(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsVarbound", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarVarbound(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarVarbound", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVbdvarVarbound(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVbdvarVarbound", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVbdcoefVarbound(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVbdcoefVarbound", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualsolVarbound(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualsolVarbound", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualfarkasVarbound(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualfarkasVarbound", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRowVarbound(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRowVarbound", 
	Ptr{_SCIP_ROW}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPmessagehdlrCapture(messagehdlr::SCIP_MESSAGEHDLR_t) = @scip_ccall("SCIPmessagehdlrCapture", 
	Void, 
	(Ptr{_SCIP_MESSAGEHDLR},), 
	pointer(messagehdlr)
)
_SCIPmessagehdlrSetLogfile(messagehdlr::SCIP_MESSAGEHDLR_t, filename::String) = @scip_ccall("SCIPmessagehdlrSetLogfile", 
	Void, 
	(Ptr{_SCIP_MESSAGEHDLR}, String), 
	pointer(messagehdlr), filename
)
_SCIPmessagehdlrSetQuiet(messagehdlr::SCIP_MESSAGEHDLR_t, quiet::_SCIP_Bool) = @scip_ccall("SCIPmessagehdlrSetQuiet", 
	Void, 
	(Ptr{_SCIP_MESSAGEHDLR}, _SCIP_Bool), 
	pointer(messagehdlr), quiet
)
_SCIPmessagePrintErrorHeader(sourcefile::String, sourceline::Int) = @scip_ccall("SCIPmessagePrintErrorHeader", 
	Void, 
	(String, Int), 
	sourcefile, sourceline
)
_SCIPmessageSetErrorPrintingDefault() = @scip_ccall("SCIPmessageSetErrorPrintingDefault", 
	Void, 
	()
)
_SCIPmessagehdlrGetData(messagehdlr::SCIP_MESSAGEHDLR_t) = @scip_ccall("SCIPmessagehdlrGetData", 
	Ptr{_SCIP_MESSAGEHDLRDATA}, 
	(Ptr{_SCIP_MESSAGEHDLR},), 
	pointer(messagehdlr)
)
_SCIPmessagehdlrIsQuiet(messagehdlr::SCIP_MESSAGEHDLR_t) = @scip_ccall("SCIPmessagehdlrIsQuiet", 
	_SCIP_Bool, 
	(Ptr{_SCIP_MESSAGEHDLR},), 
	pointer(messagehdlr)
)
_SCIPnodeselGetName(nodesel::SCIP_NODESEL_t) = @scip_ccall("SCIPnodeselGetName", 
	String, 
	(Ptr{_SCIP_NODESEL},), 
	pointer(nodesel)
)
_SCIPnodeselGetDesc(nodesel::SCIP_NODESEL_t) = @scip_ccall("SCIPnodeselGetDesc", 
	String, 
	(Ptr{_SCIP_NODESEL},), 
	pointer(nodesel)
)
_SCIPnodeselGetStdPriority(nodesel::SCIP_NODESEL_t) = @scip_ccall("SCIPnodeselGetStdPriority", 
	Int, 
	(Ptr{_SCIP_NODESEL},), 
	pointer(nodesel)
)
_SCIPnodeselGetMemsavePriority(nodesel::SCIP_NODESEL_t) = @scip_ccall("SCIPnodeselGetMemsavePriority", 
	Int, 
	(Ptr{_SCIP_NODESEL},), 
	pointer(nodesel)
)
_SCIPnodeselGetData(nodesel::SCIP_NODESEL_t) = @scip_ccall("SCIPnodeselGetData", 
	Ptr{_SCIP_NODESELDATA}, 
	(Ptr{_SCIP_NODESEL},), 
	pointer(nodesel)
)
_SCIPnodeselSetData(nodesel::SCIP_NODESEL_t, nodeseldata::SCIP_NODESELDATA_t) = @scip_ccall("SCIPnodeselSetData", 
	Void, 
	(Ptr{_SCIP_NODESEL}, Ptr{_SCIP_NODESELDATA}), 
	pointer(nodesel), pointer(nodeseldata)
)
_SCIPnodeselIsInitialized(nodesel::SCIP_NODESEL_t) = @scip_ccall("SCIPnodeselIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_NODESEL},), 
	pointer(nodesel)
)
_SCIPnodeselGetSetupTime(nodesel::SCIP_NODESEL_t) = @scip_ccall("SCIPnodeselGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_NODESEL},), 
	pointer(nodesel)
)
_SCIPnodeselGetTime(nodesel::SCIP_NODESEL_t) = @scip_ccall("SCIPnodeselGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_NODESEL},), 
	pointer(nodesel)
)
_SCIPnodesSharePath(node1::SCIP_NODE_t, node2::SCIP_NODE_t) = @scip_ccall("SCIPnodesSharePath", 
	_SCIP_Bool, 
	(Ptr{_SCIP_NODE}, Ptr{_SCIP_NODE}), 
	pointer(node1), pointer(node2)
)
_SCIPnodesGetCommonAncestor(node1::SCIP_NODE_t, node2::SCIP_NODE_t) = @scip_ccall("SCIPnodesGetCommonAncestor", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP_NODE}, Ptr{_SCIP_NODE}), 
	pointer(node1), pointer(node2)
)
_SCIPnodeGetType(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeGetType", 
	_SCIP_NODETYPE, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPnodeGetNumber(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeGetNumber", 
	Int64, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPnodeGetDepth(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeGetDepth", 
	Int, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPnodeGetLowerbound(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeGetLowerbound", 
	_SCIP_Real, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPnodeGetEstimate(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeGetEstimate", 
	_SCIP_Real, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPnodeGetDomchg(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeGetDomchg", 
	Ptr{_SCIP_DOMCHG}, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPnodeGetParent(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeGetParent", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPnodeIsActive(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeIsActive", 
	_SCIP_Bool, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPnodeIsPropagatedAgain(node::SCIP_NODE_t) = @scip_ccall("SCIPnodeIsPropagatedAgain", 
	_SCIP_Bool, 
	(Ptr{_SCIP_NODE},), 
	pointer(node)
)
_SCIPgetNVarsSOS1(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsSOS1", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsSOS1(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsSOS1", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetWeightsSOS1(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetWeightsSOS1", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPcutGetRow(cut::SCIP_CUT_t) = @scip_ccall("SCIPcutGetRow", 
	Ptr{_SCIP_ROW}, 
	(Ptr{_SCIP_CUT},), 
	pointer(cut)
)
_SCIPcutGetAge(cut::SCIP_CUT_t) = @scip_ccall("SCIPcutGetAge", 
	Int, 
	(Ptr{_SCIP_CUT},), 
	pointer(cut)
)
_SCIPcutpoolGetCuts(cutpool::SCIP_CUTPOOL_t) = @scip_ccall("SCIPcutpoolGetCuts", 
	Ptr{Ptr{_SCIP_CUT}}, 
	(Ptr{_SCIP_CUTPOOL},), 
	pointer(cutpool)
)
_SCIPcutpoolGetNCuts(cutpool::SCIP_CUTPOOL_t) = @scip_ccall("SCIPcutpoolGetNCuts", 
	Int, 
	(Ptr{_SCIP_CUTPOOL},), 
	pointer(cutpool)
)
_SCIPcutpoolGetMaxNCuts(cutpool::SCIP_CUTPOOL_t) = @scip_ccall("SCIPcutpoolGetMaxNCuts", 
	Int, 
	(Ptr{_SCIP_CUTPOOL},), 
	pointer(cutpool)
)
_SCIPcutpoolGetTime(cutpool::SCIP_CUTPOOL_t) = @scip_ccall("SCIPcutpoolGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CUTPOOL},), 
	pointer(cutpool)
)
_SCIPcutpoolGetNCalls(cutpool::SCIP_CUTPOOL_t) = @scip_ccall("SCIPcutpoolGetNCalls", 
	Int64, 
	(Ptr{_SCIP_CUTPOOL},), 
	pointer(cutpool)
)
_SCIPcutpoolGetNCutsFound(cutpool::SCIP_CUTPOOL_t) = @scip_ccall("SCIPcutpoolGetNCutsFound", 
	Int64, 
	(Ptr{_SCIP_CUTPOOL},), 
	pointer(cutpool)
)
_SCIPexprtreeGetVars(tree::SCIP_EXPRTREE_t) = @scip_ccall("SCIPexprtreeGetVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_EXPRTREE},), 
	pointer(tree)
)
_SCIPexprtreeFindVar(tree::SCIP_EXPRTREE_t, var::SCIP_VAR_t) = @scip_ccall("SCIPexprtreeFindVar", 
	Int, 
	(Ptr{_SCIP_EXPRTREE}, Ptr{_SCIP_VAR}), 
	pointer(tree), pointer(var)
)
_SCIPnlrowGetConstant(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetNLinearVars(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetNLinearVars", 
	Int, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetLinearVars(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetLinearVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetLinearCoefs(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetLinearCoefs", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetNQuadVars(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetNQuadVars", 
	Int, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetQuadVars(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetQuadVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowSearchQuadVar(nlrow::SCIP_NLROW_t, var::SCIP_VAR_t) = @scip_ccall("SCIPnlrowSearchQuadVar", 
	Int, 
	(Ptr{_SCIP_NLROW}, Ptr{_SCIP_VAR}), 
	pointer(nlrow), pointer(var)
)
_SCIPnlrowGetNQuadElems(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetNQuadElems", 
	Int, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetQuadElems(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetQuadElems", 
	Ptr{_SCIP_QUADELEM}, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetExprtree(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetExprtree", 
	Ptr{_SCIP_EXPRTREE}, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetLhs(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetLhs", 
	_SCIP_Real, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetRhs(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetRhs", 
	_SCIP_Real, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetName(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetName", 
	String, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetNLPPos(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetNLPPos", 
	Int, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowIsInNLP(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowIsInNLP", 
	_SCIP_Bool, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPnlrowGetDualsol(nlrow::SCIP_NLROW_t) = @scip_ccall("SCIPnlrowGetDualsol", 
	_SCIP_Real, 
	(Ptr{_SCIP_NLROW},), 
	pointer(nlrow)
)
_SCIPexistsConsLinking(scip::SCIP_t, intvar::SCIP_VAR_t) = @scip_ccall("SCIPexistsConsLinking", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(intvar)
)
_SCIPgetConsLinking(scip::SCIP_t, intvar::SCIP_VAR_t) = @scip_ccall("SCIPgetConsLinking", 
	Ptr{_SCIP_CONS}, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(intvar)
)
_SCIPgetIntvarLinking(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetIntvarLinking", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNBinvarsLinking(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNBinvarsLinking", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLinearConsIndicator(cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLinearConsIndicator", 
	Ptr{_SCIP_CONS}, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPgetBinaryVarIndicator(cons::SCIP_CONS_t) = @scip_ccall("SCIPgetBinaryVarIndicator", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPgetSlackVarIndicator(cons::SCIP_CONS_t) = @scip_ccall("SCIPgetSlackVarIndicator", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPisViolatedIndicator(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPisViolatedIndicator", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(cons), pointer(sol)
)
_SCIPcliqueSearchVar(clique::SCIP_CLIQUE_t, var::SCIP_VAR_t, value::_SCIP_Bool) = @scip_ccall("SCIPcliqueSearchVar", 
	Int, 
	(Ptr{_SCIP_CLIQUE}, Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(clique), pointer(var), value
)
_SCIPcliqueHasVar(clique::SCIP_CLIQUE_t, var::SCIP_VAR_t, value::_SCIP_Bool) = @scip_ccall("SCIPcliqueHasVar", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CLIQUE}, Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(clique), pointer(var), value
)
_SCIPcliqueGetNVars(clique::SCIP_CLIQUE_t) = @scip_ccall("SCIPcliqueGetNVars", 
	Int, 
	(Ptr{_SCIP_CLIQUE},), 
	pointer(clique)
)
_SCIPcliqueGetVars(clique::SCIP_CLIQUE_t) = @scip_ccall("SCIPcliqueGetVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_CLIQUE},), 
	pointer(clique)
)
_SCIPcliqueGetValues(clique::SCIP_CLIQUE_t) = @scip_ccall("SCIPcliqueGetValues", 
	Ptr{_SCIP_Bool}, 
	(Ptr{_SCIP_CLIQUE},), 
	pointer(clique)
)
_SCIPcliqueGetId(clique::SCIP_CLIQUE_t) = @scip_ccall("SCIPcliqueGetId", 
	Int, 
	(Ptr{_SCIP_CLIQUE},), 
	pointer(clique)
)
_SCIPgetNVarsXor(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsXor", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsXor(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsXor", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsXor(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsXor", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetCapacityKnapsack(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetCapacityKnapsack", 
	Int64, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNVarsKnapsack(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsKnapsack", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsKnapsack(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsKnapsack", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetWeightsKnapsack(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetWeightsKnapsack", 
	Ptr{Int64}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualsolKnapsack(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualsolKnapsack", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualfarkasKnapsack(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualfarkasKnapsack", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRowKnapsack(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRowKnapsack", 
	Ptr{_SCIP_ROW}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNVarsSOS2(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsSOS2", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsSOS2(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsSOS2", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetWeightsSOS2(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetWeightsSOS2", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNVarsBounddisjunction(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsBounddisjunction", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsBounddisjunction(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsBounddisjunction", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetBoundtypesBounddisjunction(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetBoundtypesBounddisjunction", 
	Ptr{_SCIP_BOUNDTYPE}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetBoundsBounddisjunction(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetBoundsBounddisjunction", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPconflicthdlrGetData(conflicthdlr::SCIP_CONFLICTHDLR_t) = @scip_ccall("SCIPconflicthdlrGetData", 
	Ptr{_SCIP_CONFLICTHDLRDATA}, 
	(Ptr{_SCIP_CONFLICTHDLR},), 
	pointer(conflicthdlr)
)
_SCIPconflicthdlrSetData(conflicthdlr::SCIP_CONFLICTHDLR_t, conflicthdlrdata::SCIP_CONFLICTHDLRDATA_t) = @scip_ccall("SCIPconflicthdlrSetData", 
	Void, 
	(Ptr{_SCIP_CONFLICTHDLR}, Ptr{_SCIP_CONFLICTHDLRDATA}), 
	pointer(conflicthdlr), pointer(conflicthdlrdata)
)
_SCIPconflicthdlrGetName(conflicthdlr::SCIP_CONFLICTHDLR_t) = @scip_ccall("SCIPconflicthdlrGetName", 
	String, 
	(Ptr{_SCIP_CONFLICTHDLR},), 
	pointer(conflicthdlr)
)
_SCIPconflicthdlrGetDesc(conflicthdlr::SCIP_CONFLICTHDLR_t) = @scip_ccall("SCIPconflicthdlrGetDesc", 
	String, 
	(Ptr{_SCIP_CONFLICTHDLR},), 
	pointer(conflicthdlr)
)
_SCIPconflicthdlrGetPriority(conflicthdlr::SCIP_CONFLICTHDLR_t) = @scip_ccall("SCIPconflicthdlrGetPriority", 
	Int, 
	(Ptr{_SCIP_CONFLICTHDLR},), 
	pointer(conflicthdlr)
)
_SCIPconflicthdlrIsInitialized(conflicthdlr::SCIP_CONFLICTHDLR_t) = @scip_ccall("SCIPconflicthdlrIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONFLICTHDLR},), 
	pointer(conflicthdlr)
)
_SCIPconflicthdlrGetSetupTime(conflicthdlr::SCIP_CONFLICTHDLR_t) = @scip_ccall("SCIPconflicthdlrGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONFLICTHDLR},), 
	pointer(conflicthdlr)
)
_SCIPconflicthdlrGetTime(conflicthdlr::SCIP_CONFLICTHDLR_t) = @scip_ccall("SCIPconflicthdlrGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONFLICTHDLR},), 
	pointer(conflicthdlr)
)
_SCIPgetNVarsAnd(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsAnd", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsAnd(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsAnd", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetResultantAnd(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetResultantAnd", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPisAndConsSorted(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPisAndConsSorted", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetBinaryVarSuperindicator(cons::SCIP_CONS_t) = @scip_ccall("SCIPgetBinaryVarSuperindicator", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPgetSlackConsSuperindicator(cons::SCIP_CONS_t) = @scip_ccall("SCIPgetSlackConsSuperindicator", 
	Ptr{_SCIP_CONS}, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPpropGetData(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetData", 
	Ptr{_SCIP_PROPDATA}, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropSetData(prop::SCIP_PROP_t, propdata::SCIP_PROPDATA_t) = @scip_ccall("SCIPpropSetData", 
	Void, 
	(Ptr{_SCIP_PROP}, Ptr{_SCIP_PROPDATA}), 
	pointer(prop), pointer(propdata)
)
_SCIPpropGetName(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetName", 
	String, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetDesc(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetDesc", 
	String, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetPriority(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetPriority", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetPresolPriority(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetPresolPriority", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetFreq(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetFreq", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetSetupTime(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropSetFreq(prop::SCIP_PROP_t, freq::Int) = @scip_ccall("SCIPpropSetFreq", 
	Void, 
	(Ptr{_SCIP_PROP}, Int), 
	pointer(prop), freq
)
_SCIPpropGetTime(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetStrongBranchPropTime(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetStrongBranchPropTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetRespropTime(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetRespropTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetPresolTime(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetPresolTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNCalls(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNCalls", 
	Int64, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNRespropCalls(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNRespropCalls", 
	Int64, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNCutoffs(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNCutoffs", 
	Int64, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNDomredsFound(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNDomredsFound", 
	Int64, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropIsDelayed(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropIsDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropIsPresolDelayed(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropIsPresolDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropWasDelayed(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropWasDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropWasPresolDelayed(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropWasPresolDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropIsInitialized(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNFixedVars(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNFixedVars", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNAggrVars(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNAggrVars", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNChgVarTypes(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNChgVarTypes", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNChgBds(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNChgBds", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNAddHoles(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNAddHoles", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNDelConss(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNDelConss", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNAddConss(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNAddConss", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNUpgdConss(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNUpgdConss", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNChgCoefs(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNChgCoefs", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNChgSides(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNChgSides", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetNPresolCalls(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetNPresolCalls", 
	Int, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropGetTimingmask(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropGetTimingmask", 
	_SCIP_PROPTIMING, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPpropDoesPresolve(prop::SCIP_PROP_t) = @scip_ccall("SCIPpropDoesPresolve", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PROP},), 
	pointer(prop)
)
_SCIPaddConstantQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, constant::_SCIP_Real) = @scip_ccall("SCIPaddConstantQuadratic", 
	Void, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Real), 
	pointer(scip), pointer(cons), constant
)
_SCIPgetNLinearVarsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNLinearVarsQuadratic", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLinearVarsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLinearVarsQuadratic", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetCoefsLinearVarsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetCoefsLinearVarsQuadratic", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNQuadVarTermsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNQuadVarTermsQuadratic", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetQuadVarTermsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetQuadVarTermsQuadratic", 
	Ptr{_SCIP_QUADVARTERM}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNBilinTermsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNBilinTermsQuadratic", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetBilinTermsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetBilinTermsQuadratic", 
	Ptr{_SCIP_BILINTERM}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsQuadratic", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsQuadratic", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPisConvexQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPisConvexQuadratic", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPisConcaveQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPisConcaveQuadratic", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPisLinearLocalQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPisLinearLocalQuadratic", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsLinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsLinear", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsLinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsLinear", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNVarsLinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsLinear", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsLinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsLinear", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetValsLinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetValsLinear", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetActivityLinear(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetActivityLinear", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(cons), pointer(sol)
)
_SCIPgetFeasibilityLinear(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetFeasibilityLinear", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(cons), pointer(sol)
)
_SCIPgetDualsolLinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualsolLinear", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualfarkasLinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualfarkasLinear", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRowLinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRowLinear", 
	Ptr{_SCIP_ROW}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNLhsVarsSOC(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNLhsVarsSOC", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsVarsSOC(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsVarsSOC", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsCoefsSOC(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsCoefsSOC", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsOffsetsSOC(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsOffsetsSOC", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsConstantSOC(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsConstantSOC", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsVarSOC(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsVarSOC", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsCoefSOC(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsCoefSOC", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsOffsetSOC(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsOffsetSOC", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPconshdlrGetName(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetName", 
	String, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetDesc(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetDesc", 
	String, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetData(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetData", 
	Ptr{_SCIP_CONSHDLRDATA}, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrSetData(conshdlr::SCIP_CONSHDLR_t, conshdlrdata::SCIP_CONSHDLRDATA_t) = @scip_ccall("SCIPconshdlrSetData", 
	Void, 
	(Ptr{_SCIP_CONSHDLR}, Ptr{_SCIP_CONSHDLRDATA}), 
	pointer(conshdlr), pointer(conshdlrdata)
)
_SCIPconshdlrGetConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetConss", 
	Ptr{Ptr{_SCIP_CONS}}, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetEnfoConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetEnfoConss", 
	Ptr{Ptr{_SCIP_CONS}}, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetCheckConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetCheckConss", 
	Ptr{Ptr{_SCIP_CONS}}, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNEnfoConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNEnfoConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNCheckConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNCheckConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNActiveConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNActiveConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNEnabledConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNEnabledConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetSetupTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetPresolTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetPresolTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetSepaTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetSepaTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetEnfoLPTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetEnfoLPTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetEnfoPSTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetEnfoPSTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetPropTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetPropTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetStrongBranchPropTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetStrongBranchPropTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetCheckTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetCheckTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetRespropTime(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetRespropTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNSepaCalls(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNSepaCalls", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNEnfoLPCalls(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNEnfoLPCalls", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNEnfoPSCalls(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNEnfoPSCalls", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNPropCalls(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNPropCalls", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNCheckCalls(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNCheckCalls", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNRespropCalls(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNRespropCalls", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNCutoffs(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNCutoffs", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNCutsFound(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNCutsFound", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNCutsApplied(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNCutsApplied", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNConssFound(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNConssFound", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNDomredsFound(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNDomredsFound", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNChildren(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNChildren", 
	Int64, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetMaxNActiveConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetMaxNActiveConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetStartNActiveConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetStartNActiveConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNFixedVars(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNFixedVars", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNAggrVars(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNAggrVars", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNChgVarTypes(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNChgVarTypes", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNChgBds(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNChgBds", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNAddHoles(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNAddHoles", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNDelConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNDelConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNAddConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNAddConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNUpgdConss(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNUpgdConss", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNChgCoefs(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNChgCoefs", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNChgSides(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNChgSides", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetNPresolCalls(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetNPresolCalls", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetSepaPriority(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetSepaPriority", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetEnfoPriority(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetEnfoPriority", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetCheckPriority(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetCheckPriority", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetSepaFreq(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetSepaFreq", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetPropFreq(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetPropFreq", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetEagerFreq(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetEagerFreq", 
	Int, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrNeedsCons(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrNeedsCons", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrDoesPresolve(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrDoesPresolve", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrIsSeparationDelayed(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrIsSeparationDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrIsPropagationDelayed(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrIsPropagationDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrIsPresolvingDelayed(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrIsPresolvingDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrWasLPSeparationDelayed(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrWasLPSeparationDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrWasSolSeparationDelayed(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrWasSolSeparationDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrWasPropagationDelayed(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrWasPropagationDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrWasPresolvingDelayed(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrWasPresolvingDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrIsInitialized(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrIsClonable(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrIsClonable", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconshdlrGetPropTimingmask(conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPconshdlrGetPropTimingmask", 
	_SCIP_PROPTIMING, 
	(Ptr{_SCIP_CONSHDLR},), 
	pointer(conshdlr)
)
_SCIPconsGetName(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetName", 
	String, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetPos(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetPos", 
	Int, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetHdlr(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetHdlr", 
	Ptr{_SCIP_CONSHDLR}, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetData(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetData", 
	Ptr{_SCIP_CONSDATA}, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetNUses(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetNUses", 
	Int, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetActiveDepth(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetActiveDepth", 
	Int, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetValidDepth(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetValidDepth", 
	Int, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsActive(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsActive", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsEnabled(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsEnabled", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsSeparationEnabled(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsSeparationEnabled", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsPropagationEnabled(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsPropagationEnabled", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsDeleted(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsDeleted", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsObsolete(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsObsolete", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetAge(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetAge", 
	_SCIP_Real, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsInitial(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsInitial", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsSeparated(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsSeparated", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsEnforced(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsEnforced", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsChecked(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsChecked", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsMarkedPropagate(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsMarkedPropagate", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsPropagated(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsPropagated", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsGlobal(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsGlobal", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsLocal(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsLocal", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsModifiable(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsModifiable", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsDynamic(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsDynamic", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsRemovable(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsRemovable", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsStickingAtNode(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsStickingAtNode", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsInProb(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsInProb", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsOriginal(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsOriginal", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsTransformed(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsTransformed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsLockedPos(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsLockedPos", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsLockedNeg(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsLockedNeg", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsLocked(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsLocked", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetNLocksPos(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetNLocksPos", 
	Int, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsGetNLocksNeg(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetNLocksNeg", 
	Int, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsIsAdded(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsIsAdded", 
	_SCIP_Bool, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPconsAddUpgradeLocks(cons::SCIP_CONS_t, nlocks::Int) = @scip_ccall("SCIPconsAddUpgradeLocks", 
	Void, 
	(Ptr{_SCIP_CONS}, Int), 
	pointer(cons), nlocks
)
_SCIPconsGetNUpgradeLocks(cons::SCIP_CONS_t) = @scip_ccall("SCIPconsGetNUpgradeLocks", 
	Int, 
	(Ptr{_SCIP_CONS},), 
	pointer(cons)
)
_SCIPexprcurvAdd(curv1::_SCIP_EXPRCURV, curv2::_SCIP_EXPRCURV) = @scip_ccall("SCIPexprcurvAdd", 
	_SCIP_EXPRCURV, 
	(_SCIP_EXPRCURV, _SCIP_EXPRCURV), 
	curv1, curv2
)
_SCIPexprcurvNegate(curvature::_SCIP_EXPRCURV) = @scip_ccall("SCIPexprcurvNegate", 
	_SCIP_EXPRCURV, 
	(_SCIP_EXPRCURV,), 
	curvature
)
_SCIPexprcurvMultiply(factor::_SCIP_Real, curvature::_SCIP_EXPRCURV) = @scip_ccall("SCIPexprcurvMultiply", 
	_SCIP_EXPRCURV, 
	(_SCIP_Real, _SCIP_EXPRCURV), 
	factor, curvature
)
_SCIPexprcurvPower(basebounds::_SCIP_INTERVAL, basecurv::_SCIP_EXPRCURV, exponent::_SCIP_Real) = @scip_ccall("SCIPexprcurvPower", 
	_SCIP_EXPRCURV, 
	(_SCIP_INTERVAL, _SCIP_EXPRCURV, _SCIP_Real), 
	basebounds, basecurv, exponent
)
_SCIPexprcurvGetName(curv::_SCIP_EXPRCURV) = @scip_ccall("SCIPexprcurvGetName", 
	String, 
	(_SCIP_EXPRCURV,), 
	curv
)
_SCIPexpropGetName(op::_SCIP_EXPROP) = @scip_ccall("SCIPexpropGetName", 
	String, 
	(_SCIP_EXPROP,), 
	op
)
_SCIPexpropGetNChildren(op::_SCIP_EXPROP) = @scip_ccall("SCIPexpropGetNChildren", 
	Int, 
	(_SCIP_EXPROP,), 
	op
)
_SCIPexprGetOperator(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetOperator", 
	_SCIP_EXPROP, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetNChildren(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetNChildren", 
	Int, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetChildren(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetChildren", 
	Ptr{Ptr{_SCIP_EXPR}}, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetOpIndex(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetOpIndex", 
	Int, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetOpReal(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetOpReal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetRealPowerExponent(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetRealPowerExponent", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetIntPowerExponent(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetIntPowerExponent", 
	Int, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetSignPowerExponent(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetSignPowerExponent", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetLinearCoefs(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetLinearCoefs", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetLinearConstant(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetLinearConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetQuadElements(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetQuadElements", 
	Ptr{_SCIP_QUADELEM}, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetQuadConstant(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetQuadConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetQuadLinearCoefs(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetQuadLinearCoefs", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetNQuadElements(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetNQuadElements", 
	Int, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetMonomials(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetMonomials", 
	Ptr{Ptr{_SCIP_EXPRDATA_MONOMIAL}}, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetNMonomials(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetNMonomials", 
	Int, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetPolynomialConstant(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprGetPolynomialConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprGetMonomialCoef(monomial::SCIP_EXPRDATA_MONOMIAL_t) = @scip_ccall("SCIPexprGetMonomialCoef", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPRDATA_MONOMIAL},), 
	pointer(monomial)
)
_SCIPexprGetMonomialNFactors(monomial::SCIP_EXPRDATA_MONOMIAL_t) = @scip_ccall("SCIPexprGetMonomialNFactors", 
	Int, 
	(Ptr{_SCIP_EXPRDATA_MONOMIAL},), 
	pointer(monomial)
)
_SCIPexprGetMonomialExponents(monomial::SCIP_EXPRDATA_MONOMIAL_t) = @scip_ccall("SCIPexprGetMonomialExponents", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_EXPRDATA_MONOMIAL},), 
	pointer(monomial)
)
_SCIPexprSortQuadElems(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprSortQuadElems", 
	Void, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprChgPolynomialConstant(expr::SCIP_EXPR_t, constant::_SCIP_Real) = @scip_ccall("SCIPexprChgPolynomialConstant", 
	Void, 
	(Ptr{_SCIP_EXPR}, _SCIP_Real), 
	pointer(expr), constant
)
_SCIPexprSortMonomialFactors(monomial::SCIP_EXPRDATA_MONOMIAL_t) = @scip_ccall("SCIPexprSortMonomialFactors", 
	Void, 
	(Ptr{_SCIP_EXPRDATA_MONOMIAL},), 
	pointer(monomial)
)
_SCIPexprAreMonomialsEqual(monomial1::SCIP_EXPRDATA_MONOMIAL_t, monomial2::SCIP_EXPRDATA_MONOMIAL_t, eps::_SCIP_Real) = @scip_ccall("SCIPexprAreMonomialsEqual", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPRDATA_MONOMIAL}, Ptr{_SCIP_EXPRDATA_MONOMIAL}, _SCIP_Real), 
	pointer(monomial1), pointer(monomial2), eps
)
_SCIPexprChgMonomialCoef(monomial::SCIP_EXPRDATA_MONOMIAL_t, newcoef::_SCIP_Real) = @scip_ccall("SCIPexprChgMonomialCoef", 
	Void, 
	(Ptr{_SCIP_EXPRDATA_MONOMIAL}, _SCIP_Real), 
	pointer(monomial), newcoef
)
_SCIPexprMonomialPower(monomial::SCIP_EXPRDATA_MONOMIAL_t, exponent::Int) = @scip_ccall("SCIPexprMonomialPower", 
	Void, 
	(Ptr{_SCIP_EXPRDATA_MONOMIAL}, Int), 
	pointer(monomial), exponent
)
_SCIPexprMergeMonomialFactors(monomial::SCIP_EXPRDATA_MONOMIAL_t, eps::_SCIP_Real) = @scip_ccall("SCIPexprMergeMonomialFactors", 
	Void, 
	(Ptr{_SCIP_EXPRDATA_MONOMIAL}, _SCIP_Real), 
	pointer(monomial), eps
)
_SCIPexprSortMonomials(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprSortMonomials", 
	Void, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprHasParam(expr::SCIP_EXPR_t) = @scip_ccall("SCIPexprHasParam", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPR},), 
	pointer(expr)
)
_SCIPexprAreEqual(expr1::SCIP_EXPR_t, expr2::SCIP_EXPR_t, eps::_SCIP_Real) = @scip_ccall("SCIPexprAreEqual", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPR}, Ptr{_SCIP_EXPR}, _SCIP_Real), 
	pointer(expr1), pointer(expr2), eps
)
_SCIPexprtreeGetRoot(tree::SCIP_EXPRTREE_t) = @scip_ccall("SCIPexprtreeGetRoot", 
	Ptr{_SCIP_EXPR}, 
	(Ptr{_SCIP_EXPRTREE},), 
	pointer(tree)
)
_SCIPexprtreeGetNVars(tree::SCIP_EXPRTREE_t) = @scip_ccall("SCIPexprtreeGetNVars", 
	Int, 
	(Ptr{_SCIP_EXPRTREE},), 
	pointer(tree)
)
_SCIPexprtreeGetNParams(tree::SCIP_EXPRTREE_t) = @scip_ccall("SCIPexprtreeGetNParams", 
	Int, 
	(Ptr{_SCIP_EXPRTREE},), 
	pointer(tree)
)
_SCIPexprtreeGetParamVals(tree::SCIP_EXPRTREE_t) = @scip_ccall("SCIPexprtreeGetParamVals", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_EXPRTREE},), 
	pointer(tree)
)
_SCIPexprtreeSetParamVal(tree::SCIP_EXPRTREE_t, paramidx::Int, paramval::_SCIP_Real) = @scip_ccall("SCIPexprtreeSetParamVal", 
	Void, 
	(Ptr{_SCIP_EXPRTREE}, Int, _SCIP_Real), 
	pointer(tree), paramidx, paramval
)
_SCIPexprtreeGetInterpreterData(tree::SCIP_EXPRTREE_t) = @scip_ccall("SCIPexprtreeGetInterpreterData", 
	Ptr{_SCIP_EXPRINTDATA}, 
	(Ptr{_SCIP_EXPRTREE},), 
	pointer(tree)
)
_SCIPexprtreeSetInterpreterData(tree::SCIP_EXPRTREE_t, interpreterdata::SCIP_EXPRINTDATA_t) = @scip_ccall("SCIPexprtreeSetInterpreterData", 
	Void, 
	(Ptr{_SCIP_EXPRTREE}, Ptr{_SCIP_EXPRINTDATA}), 
	pointer(tree), pointer(interpreterdata)
)
_SCIPexprtreeHasParam(tree::SCIP_EXPRTREE_t) = @scip_ccall("SCIPexprtreeHasParam", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPRTREE},), 
	pointer(tree)
)
_SCIPquadelemSort(quadelems::SCIP_QUADELEM_t, nquadelems::Int) = @scip_ccall("SCIPquadelemSort", 
	Void, 
	(Ptr{_SCIP_QUADELEM}, Int), 
	pointer(quadelems), nquadelems
)
_SCIPexprgraphCaptureNode(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphCaptureNode", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphIsNodeEnabled(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphIsNodeEnabled", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeNChildren(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeNChildren", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeChildren(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeChildren", 
	Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeNParents(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeNParents", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeParents(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeParents", 
	Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeDepth(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeDepth", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodePosition(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodePosition", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeOperator(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeOperator", 
	_SCIP_EXPROP, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeOperatorIndex(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeOperatorIndex", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeOperatorReal(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeOperatorReal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeRealPowerExponent(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeRealPowerExponent", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeIntPowerExponent(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeIntPowerExponent", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeSignPowerExponent(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeSignPowerExponent", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeLinearCoefs(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeLinearCoefs", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeLinearConstant(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeLinearConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeQuadraticConstant(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeQuadraticConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeQuadraticLinearCoefs(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeQuadraticLinearCoefs", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeQuadraticQuadElements(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeQuadraticQuadElements", 
	Ptr{_SCIP_QUADELEM}, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeQuadraticNQuadElements(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeQuadraticNQuadElements", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodePolynomialMonomials(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodePolynomialMonomials", 
	Ptr{Ptr{_SCIP_EXPRDATA_MONOMIAL}}, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodePolynomialNMonomials(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodePolynomialNMonomials", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodePolynomialConstant(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodePolynomialConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeBounds(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeBounds", 
	_SCIP_INTERVAL, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeVal(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeVal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphGetNodeCurvature(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetNodeCurvature", 
	_SCIP_EXPRCURV, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphEnableNode(exprgraph::SCIP_EXPRGRAPH_t, node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphEnableNode", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_EXPRGRAPHNODE}), 
	pointer(exprgraph), pointer(node)
)
_SCIPexprgraphDisableNode(exprgraph::SCIP_EXPRGRAPH_t, node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphDisableNode", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_EXPRGRAPHNODE}), 
	pointer(exprgraph), pointer(node)
)
_SCIPexprgraphHasNodeSibling(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphHasNodeSibling", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphAreAllNodeChildrenVars(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphAreAllNodeChildrenVars", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphHasNodeNonlinearAncestor(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphHasNodeNonlinearAncestor", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPexprgraphTightenNodeBounds(exprgraph::SCIP_EXPRGRAPH_t, node::SCIP_EXPRGRAPHNODE_t, nodebounds::_SCIP_INTERVAL, minstrength::_SCIP_Real, cutoff::SCIP_Bool_t) = @scip_ccall("SCIPexprgraphTightenNodeBounds", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_EXPRGRAPHNODE}, _SCIP_INTERVAL, _SCIP_Real, Ptr{_SCIP_Bool}), 
	pointer(exprgraph), pointer(node), nodebounds, minstrength, pointer(cutoff)
)
_SCIPexprgraphGetDepth(exprgraph::SCIP_EXPRGRAPH_t) = @scip_ccall("SCIPexprgraphGetDepth", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPH},), 
	pointer(exprgraph)
)
_SCIPexprgraphGetNodes(exprgraph::SCIP_EXPRGRAPH_t) = @scip_ccall("SCIPexprgraphGetNodes", 
	Ptr{Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}}, 
	(Ptr{_SCIP_EXPRGRAPH},), 
	pointer(exprgraph)
)
_SCIPexprgraphGetNVars(exprgraph::SCIP_EXPRGRAPH_t) = @scip_ccall("SCIPexprgraphGetNVars", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPH},), 
	pointer(exprgraph)
)
_SCIPexprgraphGetVarNodes(exprgraph::SCIP_EXPRGRAPH_t) = @scip_ccall("SCIPexprgraphGetVarNodes", 
	Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}, 
	(Ptr{_SCIP_EXPRGRAPH},), 
	pointer(exprgraph)
)
_SCIPexprgraphSetVarNodeValue(varnode::SCIP_EXPRGRAPHNODE_t, value::_SCIP_Real) = @scip_ccall("SCIPexprgraphSetVarNodeValue", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPHNODE}, _SCIP_Real), 
	pointer(varnode), value
)
_SCIPexprgraphSetVarsBounds(exprgraph::SCIP_EXPRGRAPH_t, varbounds::SCIP_INTERVAL_t) = @scip_ccall("SCIPexprgraphSetVarsBounds", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_INTERVAL}), 
	pointer(exprgraph), pointer(varbounds)
)
_SCIPexprgraphSetVarNodeBounds(exprgraph::SCIP_EXPRGRAPH_t, varnode::SCIP_EXPRGRAPHNODE_t, varbounds::_SCIP_INTERVAL) = @scip_ccall("SCIPexprgraphSetVarNodeBounds", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_EXPRGRAPHNODE}, _SCIP_INTERVAL), 
	pointer(exprgraph), pointer(varnode), varbounds
)
_SCIPexprgraphSetVarNodeLb(exprgraph::SCIP_EXPRGRAPH_t, varnode::SCIP_EXPRGRAPHNODE_t, lb::_SCIP_Real) = @scip_ccall("SCIPexprgraphSetVarNodeLb", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_EXPRGRAPHNODE}, _SCIP_Real), 
	pointer(exprgraph), pointer(varnode), lb
)
_SCIPexprgraphSetVarNodeUb(exprgraph::SCIP_EXPRGRAPH_t, varnode::SCIP_EXPRGRAPHNODE_t, ub::_SCIP_Real) = @scip_ccall("SCIPexprgraphSetVarNodeUb", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_EXPRGRAPHNODE}, _SCIP_Real), 
	pointer(exprgraph), pointer(varnode), ub
)
_SCIPexprgraphGetVarsBounds(exprgraph::SCIP_EXPRGRAPH_t) = @scip_ccall("SCIPexprgraphGetVarsBounds", 
	Ptr{_SCIP_INTERVAL}, 
	(Ptr{_SCIP_EXPRGRAPH},), 
	pointer(exprgraph)
)
_SCIPexprgraphFindConstNode(exprgraph::SCIP_EXPRGRAPH_t, constant::_SCIP_Real, constnode::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphFindConstNode", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EXPRGRAPH}, _SCIP_Real, Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}), 
	pointer(exprgraph), constant, array(constnode)
)
_SCIPexprgraphPropagateNodeBounds(exprgraph::SCIP_EXPRGRAPH_t, infinity::_SCIP_Real, minstrength::_SCIP_Real, cutoff::SCIP_Bool_t) = @scip_ccall("SCIPexprgraphPropagateNodeBounds", 
	Void, 
	(Ptr{_SCIP_EXPRGRAPH}, _SCIP_Real, _SCIP_Real, Ptr{_SCIP_Bool}), 
	pointer(exprgraph), infinity, minstrength, pointer(cutoff)
)
_SCIPexprgraphGetSumTreesNSummands(node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall("SCIPexprgraphGetSumTreesNSummands", 
	Int, 
	(Ptr{_SCIP_EXPRGRAPHNODE},), 
	pointer(node)
)
_SCIPgetNVarsOr(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsOr", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsOr(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsOr", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetResultantOr(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetResultantOr", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPdispGetData(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispGetData", 
	Ptr{_SCIP_DISPDATA}, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPdispSetData(disp::SCIP_DISP_t, dispdata::SCIP_DISPDATA_t) = @scip_ccall("SCIPdispSetData", 
	Void, 
	(Ptr{_SCIP_DISP}, Ptr{_SCIP_DISPDATA}), 
	pointer(disp), pointer(dispdata)
)
_SCIPdispGetName(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispGetName", 
	String, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPdispGetDesc(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispGetDesc", 
	String, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPdispGetHeader(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispGetHeader", 
	String, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPdispGetWidth(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispGetWidth", 
	Int, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPdispGetPriority(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispGetPriority", 
	Int, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPdispGetPosition(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispGetPosition", 
	Int, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPdispGetStatus(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispGetStatus", 
	_SCIP_DISPSTATUS, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPdispIsInitialized(disp::SCIP_DISP_t) = @scip_ccall("SCIPdispIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_DISP},), 
	pointer(disp)
)
_SCIPpresolGetData(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetData", 
	Ptr{_SCIP_PRESOLDATA}, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolSetData(presol::SCIP_PRESOL_t, presoldata::SCIP_PRESOLDATA_t) = @scip_ccall("SCIPpresolSetData", 
	Void, 
	(Ptr{_SCIP_PRESOL}, Ptr{_SCIP_PRESOLDATA}), 
	pointer(presol), pointer(presoldata)
)
_SCIPpresolGetName(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetName", 
	String, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetDesc(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetDesc", 
	String, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetPriority(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetPriority", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolIsDelayed(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolIsDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolWasDelayed(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolWasDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolIsInitialized(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetSetupTime(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetTime(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNFixedVars(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNFixedVars", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNAggrVars(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNAggrVars", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNChgVarTypes(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNChgVarTypes", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNChgBds(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNChgBds", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNAddHoles(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNAddHoles", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNDelConss(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNDelConss", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNAddConss(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNAddConss", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNUpgdConss(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNUpgdConss", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNChgCoefs(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNChgCoefs", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNChgSides(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNChgSides", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPpresolGetNCalls(presol::SCIP_PRESOL_t) = @scip_ccall("SCIPpresolGetNCalls", 
	Int, 
	(Ptr{_SCIP_PRESOL},), 
	pointer(presol)
)
_SCIPhistoryGetVSIDS(history::SCIP_HISTORY_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPhistoryGetVSIDS", 
	_SCIP_Real, 
	(Ptr{_SCIP_HISTORY}, _SCIP_BRANCHDIR), 
	pointer(history), dir
)
_SCIPhistoryGetCutoffSum(history::SCIP_HISTORY_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPhistoryGetCutoffSum", 
	_SCIP_Real, 
	(Ptr{_SCIP_HISTORY}, _SCIP_BRANCHDIR), 
	pointer(history), dir
)
_SCIPvaluehistoryGetNValues(valuehistory::SCIP_VALUEHISTORY_t) = @scip_ccall("SCIPvaluehistoryGetNValues", 
	Int, 
	(Ptr{_SCIP_VALUEHISTORY},), 
	pointer(valuehistory)
)
_SCIPvaluehistoryGetHistories(valuehistory::SCIP_VALUEHISTORY_t) = @scip_ccall("SCIPvaluehistoryGetHistories", 
	Ptr{Ptr{_SCIP_HISTORY}}, 
	(Ptr{_SCIP_VALUEHISTORY},), 
	pointer(valuehistory)
)
_SCIPvaluehistoryGetValues(valuehistory::SCIP_VALUEHISTORY_t) = @scip_ccall("SCIPvaluehistoryGetValues", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_VALUEHISTORY},), 
	pointer(valuehistory)
)
_SCIPsparseSolFree(sparsesol::SCIP_SPARSESOL_t) = @scip_ccall("SCIPsparseSolFree", 
	Void, 
	(Ptr{Ptr{_SCIP_SPARSESOL}},), 
	array(sparsesol)
)
_SCIPsparseSolGetVars(sparsesol::SCIP_SPARSESOL_t) = @scip_ccall("SCIPsparseSolGetVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_SPARSESOL},), 
	pointer(sparsesol)
)
_SCIPsparseSolGetNVars(sparsesol::SCIP_SPARSESOL_t) = @scip_ccall("SCIPsparseSolGetNVars", 
	Int, 
	(Ptr{_SCIP_SPARSESOL},), 
	pointer(sparsesol)
)
_SCIPsparseSolGetLbs(sparsesol::SCIP_SPARSESOL_t) = @scip_ccall("SCIPsparseSolGetLbs", 
	Ptr{Int64}, 
	(Ptr{_SCIP_SPARSESOL},), 
	pointer(sparsesol)
)
_SCIPsparseSolGetUbs(sparsesol::SCIP_SPARSESOL_t) = @scip_ccall("SCIPsparseSolGetUbs", 
	Ptr{Int64}, 
	(Ptr{_SCIP_SPARSESOL},), 
	pointer(sparsesol)
)
_SCIPsparseSolGetFirstSol(sparsesol::SCIP_SPARSESOL_t, sol::Int64, nvars::Int) = @scip_ccall("SCIPsparseSolGetFirstSol", 
	Void, 
	(Ptr{_SCIP_SPARSESOL}, Ptr{Int64}, Int), 
	pointer(sparsesol), pointer(sol), nvars
)
_SCIPsparseSolGetNextSol(sparsesol::SCIP_SPARSESOL_t, sol::Int64, nvars::Int) = @scip_ccall("SCIPsparseSolGetNextSol", 
	_SCIP_Bool, 
	(Ptr{_SCIP_SPARSESOL}, Ptr{Int64}, Int), 
	pointer(sparsesol), pointer(sol), nvars
)
_SCIPqueueFree(queue::SCIP_QUEUE_t) = @scip_ccall("SCIPqueueFree", 
	Void, 
	(Ptr{Ptr{_SCIP_QUEUE}},), 
	array(queue)
)
_SCIPqueueClear(queue::SCIP_QUEUE_t) = @scip_ccall("SCIPqueueClear", 
	Void, 
	(Ptr{_SCIP_QUEUE},), 
	pointer(queue)
)
_SCIPqueueIsEmpty(queue::SCIP_QUEUE_t) = @scip_ccall("SCIPqueueIsEmpty", 
	_SCIP_Bool, 
	(Ptr{_SCIP_QUEUE},), 
	pointer(queue)
)
_SCIPqueueNElems(queue::SCIP_QUEUE_t) = @scip_ccall("SCIPqueueNElems", 
	Int, 
	(Ptr{_SCIP_QUEUE},), 
	pointer(queue)
)
_SCIPpqueueFree(pqueue::SCIP_PQUEUE_t) = @scip_ccall("SCIPpqueueFree", 
	Void, 
	(Ptr{Ptr{_SCIP_PQUEUE}},), 
	array(pqueue)
)
_SCIPpqueueClear(pqueue::SCIP_PQUEUE_t) = @scip_ccall("SCIPpqueueClear", 
	Void, 
	(Ptr{_SCIP_PQUEUE},), 
	pointer(pqueue)
)
_SCIPpqueueNElems(pqueue::SCIP_PQUEUE_t) = @scip_ccall("SCIPpqueueNElems", 
	Int, 
	(Ptr{_SCIP_PQUEUE},), 
	pointer(pqueue)
)
_SCIPcalcHashtableSize(minsize::Int) = @scip_ccall("SCIPcalcHashtableSize", 
	Int, 
	(Int,), 
	minsize
)
_SCIPhashtableFree(hashtable::SCIP_HASHTABLE_t) = @scip_ccall("SCIPhashtableFree", 
	Void, 
	(Ptr{Ptr{_SCIP_HASHTABLE}},), 
	array(hashtable)
)
_SCIPhashtableClear(hashtable::SCIP_HASHTABLE_t) = @scip_ccall("SCIPhashtableClear", 
	Void, 
	(Ptr{_SCIP_HASHTABLE},), 
	pointer(hashtable)
)
_SCIPhashtableRemoveAll(hashtable::SCIP_HASHTABLE_t) = @scip_ccall("SCIPhashtableRemoveAll", 
	Void, 
	(Ptr{_SCIP_HASHTABLE},), 
	pointer(hashtable)
)
_SCIPhashtableGetNElements(hashtable::SCIP_HASHTABLE_t) = @scip_ccall("SCIPhashtableGetNElements", 
	Int64, 
	(Ptr{_SCIP_HASHTABLE},), 
	pointer(hashtable)
)
_SCIPhashtableGetLoad(hashtable::SCIP_HASHTABLE_t) = @scip_ccall("SCIPhashtableGetLoad", 
	_SCIP_Real, 
	(Ptr{_SCIP_HASHTABLE},), 
	pointer(hashtable)
)
_SCIPhashtablePrintStatistics(hashtable::SCIP_HASHTABLE_t, messagehdlr::SCIP_MESSAGEHDLR_t) = @scip_ccall("SCIPhashtablePrintStatistics", 
	Void, 
	(Ptr{_SCIP_HASHTABLE}, Ptr{_SCIP_MESSAGEHDLR}), 
	pointer(hashtable), pointer(messagehdlr)
)
_SCIPhashmapFree(hashmap::SCIP_HASHMAP_t) = @scip_ccall("SCIPhashmapFree", 
	Void, 
	(Ptr{Ptr{_SCIP_HASHMAP}},), 
	array(hashmap)
)
_SCIPhashmapPrintStatistics(hashmap::SCIP_HASHMAP_t, messagehdlr::SCIP_MESSAGEHDLR_t) = @scip_ccall("SCIPhashmapPrintStatistics", 
	Void, 
	(Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_MESSAGEHDLR}), 
	pointer(hashmap), pointer(messagehdlr)
)
_SCIPhashmapIsEmpty(hashmap::SCIP_HASHMAP_t) = @scip_ccall("SCIPhashmapIsEmpty", 
	_SCIP_Bool, 
	(Ptr{_SCIP_HASHMAP},), 
	pointer(hashmap)
)
_SCIPhashmapGetNEntries(hashmap::SCIP_HASHMAP_t) = @scip_ccall("SCIPhashmapGetNEntries", 
	Int, 
	(Ptr{_SCIP_HASHMAP},), 
	pointer(hashmap)
)
_SCIPhashmapGetNLists(hashmap::SCIP_HASHMAP_t) = @scip_ccall("SCIPhashmapGetNLists", 
	Int, 
	(Ptr{_SCIP_HASHMAP},), 
	pointer(hashmap)
)
_SCIPhashmapGetList(hashmap::SCIP_HASHMAP_t, listindex::Int) = @scip_ccall("SCIPhashmapGetList", 
	Ptr{_SCIP_HASHMAPLIST}, 
	(Ptr{_SCIP_HASHMAP}, Int), 
	pointer(hashmap), listindex
)
_SCIPhashmapListGetNEntries(hashmaplist::SCIP_HASHMAPLIST_t) = @scip_ccall("SCIPhashmapListGetNEntries", 
	Int, 
	(Ptr{_SCIP_HASHMAPLIST},), 
	pointer(hashmaplist)
)
_SCIPhashmapListGetNext(hashmaplist::SCIP_HASHMAPLIST_t) = @scip_ccall("SCIPhashmapListGetNext", 
	Ptr{_SCIP_HASHMAPLIST}, 
	(Ptr{_SCIP_HASHMAPLIST},), 
	pointer(hashmaplist)
)
_SCIPactivityFree(activity::SCIP_RESOURCEACTIVITY_t) = @scip_ccall("SCIPactivityFree", 
	Void, 
	(Ptr{Ptr{_SCIP_RESOURCEACTIVITY}},), 
	array(activity)
)
_SCIPactivityGetVar(activity::SCIP_RESOURCEACTIVITY_t) = @scip_ccall("SCIPactivityGetVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_RESOURCEACTIVITY},), 
	pointer(activity)
)
_SCIPactivityGetDuration(activity::SCIP_RESOURCEACTIVITY_t) = @scip_ccall("SCIPactivityGetDuration", 
	Int, 
	(Ptr{_SCIP_RESOURCEACTIVITY},), 
	pointer(activity)
)
_SCIPactivityGetDemand(activity::SCIP_RESOURCEACTIVITY_t) = @scip_ccall("SCIPactivityGetDemand", 
	Int, 
	(Ptr{_SCIP_RESOURCEACTIVITY},), 
	pointer(activity)
)
_SCIPactivityGetEnergy(activity::SCIP_RESOURCEACTIVITY_t) = @scip_ccall("SCIPactivityGetEnergy", 
	Int, 
	(Ptr{_SCIP_RESOURCEACTIVITY},), 
	pointer(activity)
)
_SCIPprofileFree(profile::SCIP_PROFILE_t) = @scip_ccall("SCIPprofileFree", 
	Void, 
	(Ptr{Ptr{_SCIP_PROFILE}},), 
	array(profile)
)
_SCIPprofileGetCapacity(profile::SCIP_PROFILE_t) = @scip_ccall("SCIPprofileGetCapacity", 
	Int, 
	(Ptr{_SCIP_PROFILE},), 
	pointer(profile)
)
_SCIPprofileGetNTimepoints(profile::SCIP_PROFILE_t) = @scip_ccall("SCIPprofileGetNTimepoints", 
	Int, 
	(Ptr{_SCIP_PROFILE},), 
	pointer(profile)
)
_SCIPprofileGetTime(profile::SCIP_PROFILE_t, pos::Int) = @scip_ccall("SCIPprofileGetTime", 
	Int, 
	(Ptr{_SCIP_PROFILE}, Int), 
	pointer(profile), pos
)
_SCIPprofileGetLoad(profile::SCIP_PROFILE_t, pos::Int) = @scip_ccall("SCIPprofileGetLoad", 
	Int, 
	(Ptr{_SCIP_PROFILE}, Int), 
	pointer(profile), pos
)
_SCIPprofileGetEarliestFeasibleStart(profile::SCIP_PROFILE_t, est::Int, lst::Int, duration::Int, height::Int, infeasible::SCIP_Bool_t) = @scip_ccall("SCIPprofileGetEarliestFeasibleStart", 
	Int, 
	(Ptr{_SCIP_PROFILE}, Int, Int, Int, Int, Ptr{_SCIP_Bool}), 
	pointer(profile), est, lst, duration, height, pointer(infeasible)
)
_SCIPprofileGetLatestFeasibleStart(profile::SCIP_PROFILE_t, lb::Int, ub::Int, duration::Int, height::Int, infeasible::SCIP_Bool_t) = @scip_ccall("SCIPprofileGetLatestFeasibleStart", 
	Int, 
	(Ptr{_SCIP_PROFILE}, Int, Int, Int, Int, Ptr{_SCIP_Bool}), 
	pointer(profile), lb, ub, duration, height, pointer(infeasible)
)
_SCIPdigraphFree(digraph::SCIP_DIGRAPH_t) = @scip_ccall("SCIPdigraphFree", 
	Void, 
	(Ptr{Ptr{_SCIP_DIGRAPH}},), 
	array(digraph)
)
_SCIPdigraphGetNNodes(digraph::SCIP_DIGRAPH_t) = @scip_ccall("SCIPdigraphGetNNodes", 
	Int, 
	(Ptr{_SCIP_DIGRAPH},), 
	pointer(digraph)
)
_SCIPdigraphGetNArcs(digraph::SCIP_DIGRAPH_t) = @scip_ccall("SCIPdigraphGetNArcs", 
	Int, 
	(Ptr{_SCIP_DIGRAPH},), 
	pointer(digraph)
)
_SCIPdigraphGetNSuccessors(digraph::SCIP_DIGRAPH_t, node::Int) = @scip_ccall("SCIPdigraphGetNSuccessors", 
	Int, 
	(Ptr{_SCIP_DIGRAPH}, Int), 
	pointer(digraph), node
)
_SCIPdigraphGetNComponents(digraph::SCIP_DIGRAPH_t) = @scip_ccall("SCIPdigraphGetNComponents", 
	Int, 
	(Ptr{_SCIP_DIGRAPH},), 
	pointer(digraph)
)
_SCIPdigraphFreeComponents(digraph::SCIP_DIGRAPH_t) = @scip_ccall("SCIPdigraphFreeComponents", 
	Void, 
	(Ptr{_SCIP_DIGRAPH},), 
	pointer(digraph)
)
_SCIPbtnodeFree(tree::SCIP_BT_t, node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeFree", 
	Void, 
	(Ptr{_SCIP_BT}, Ptr{Ptr{_SCIP_BTNODE}}), 
	pointer(tree), array(node)
)
_SCIPbtnodeGetParent(node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeGetParent", 
	Ptr{_SCIP_BTNODE}, 
	(Ptr{_SCIP_BTNODE},), 
	pointer(node)
)
_SCIPbtnodeGetLeftchild(node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeGetLeftchild", 
	Ptr{_SCIP_BTNODE}, 
	(Ptr{_SCIP_BTNODE},), 
	pointer(node)
)
_SCIPbtnodeGetRightchild(node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeGetRightchild", 
	Ptr{_SCIP_BTNODE}, 
	(Ptr{_SCIP_BTNODE},), 
	pointer(node)
)
_SCIPbtnodeGetSibling(node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeGetSibling", 
	Ptr{_SCIP_BTNODE}, 
	(Ptr{_SCIP_BTNODE},), 
	pointer(node)
)
_SCIPbtnodeIsRoot(node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeIsRoot", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BTNODE},), 
	pointer(node)
)
_SCIPbtnodeIsLeaf(node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeIsLeaf", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BTNODE},), 
	pointer(node)
)
_SCIPbtnodeIsLeftchild(node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeIsLeftchild", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BTNODE},), 
	pointer(node)
)
_SCIPbtnodeIsRightchild(node::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeIsRightchild", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BTNODE},), 
	pointer(node)
)
_SCIPbtnodeSetParent(node::SCIP_BTNODE_t, parent::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeSetParent", 
	Void, 
	(Ptr{_SCIP_BTNODE}, Ptr{_SCIP_BTNODE}), 
	pointer(node), pointer(parent)
)
_SCIPbtnodeSetLeftchild(node::SCIP_BTNODE_t, left::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeSetLeftchild", 
	Void, 
	(Ptr{_SCIP_BTNODE}, Ptr{_SCIP_BTNODE}), 
	pointer(node), pointer(left)
)
_SCIPbtnodeSetRightchild(node::SCIP_BTNODE_t, right::SCIP_BTNODE_t) = @scip_ccall("SCIPbtnodeSetRightchild", 
	Void, 
	(Ptr{_SCIP_BTNODE}, Ptr{_SCIP_BTNODE}), 
	pointer(node), pointer(right)
)
_SCIPbtFree(tree::SCIP_BT_t) = @scip_ccall("SCIPbtFree", 
	Void, 
	(Ptr{Ptr{_SCIP_BT}},), 
	array(tree)
)
_SCIPbtIsEmpty(tree::SCIP_BT_t) = @scip_ccall("SCIPbtIsEmpty", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BT},), 
	pointer(tree)
)
_SCIPbtGetRoot(tree::SCIP_BT_t) = @scip_ccall("SCIPbtGetRoot", 
	Ptr{_SCIP_BTNODE}, 
	(Ptr{_SCIP_BT},), 
	pointer(tree)
)
_SCIPbtSetRoot(tree::SCIP_BT_t, root::SCIP_BTNODE_t) = @scip_ccall("SCIPbtSetRoot", 
	Void, 
	(Ptr{_SCIP_BT}, Ptr{_SCIP_BTNODE}), 
	pointer(tree), pointer(root)
)
_SCIPsortReal(realarray::SCIP_Real_t, len::Int) = @scip_ccall("SCIPsortReal", 
	Void, 
	(Ptr{_SCIP_Real}, Int), 
	pointer(realarray), len
)
_SCIPsortLong(longarray::Int64, len::Int) = @scip_ccall("SCIPsortLong", 
	Void, 
	(Ptr{Int64}, Int), 
	pointer(longarray), len
)
_SCIPsortDownReal(realarray::SCIP_Real_t, len::Int) = @scip_ccall("SCIPsortDownReal", 
	Void, 
	(Ptr{_SCIP_Real}, Int), 
	pointer(realarray), len
)
_SCIPsortDownLong(longarray::Int64, len::Int) = @scip_ccall("SCIPsortDownLong", 
	Void, 
	(Ptr{Int64}, Int), 
	pointer(longarray), len
)
_SCIPcalcMachineEpsilon() = @scip_ccall("SCIPcalcMachineEpsilon", 
	_SCIP_Real, 
	()
)
_SCIPcalcGreComDiv(val1::Int64, val2::Int64) = @scip_ccall("SCIPcalcGreComDiv", 
	Int64, 
	(Int64, Int64), 
	val1, val2
)
_SCIPcalcSmaComMul(val1::Int64, val2::Int64) = @scip_ccall("SCIPcalcSmaComMul", 
	Int64, 
	(Int64, Int64), 
	val1, val2
)
_SCIPrealToRational(val::_SCIP_Real, mindelta::_SCIP_Real, maxdelta::_SCIP_Real, maxdnom::Int64, nominator::Int64, denominator::Int64) = @scip_ccall("SCIPrealToRational", 
	_SCIP_Bool, 
	(_SCIP_Real, _SCIP_Real, _SCIP_Real, Int64, Ptr{Int64}, Ptr{Int64}), 
	val, mindelta, maxdelta, maxdnom, pointer(nominator), pointer(denominator)
)
_SCIPfindSimpleRational(lb::_SCIP_Real, ub::_SCIP_Real, maxdnom::Int64, nominator::Int64, denominator::Int64) = @scip_ccall("SCIPfindSimpleRational", 
	_SCIP_Bool, 
	(_SCIP_Real, _SCIP_Real, Int64, Ptr{Int64}, Ptr{Int64}), 
	lb, ub, maxdnom, pointer(nominator), pointer(denominator)
)
_SCIPselectSimpleValue(lb::_SCIP_Real, ub::_SCIP_Real, maxdnom::Int64) = @scip_ccall("SCIPselectSimpleValue", 
	_SCIP_Real, 
	(_SCIP_Real, _SCIP_Real, Int64), 
	lb, ub, maxdnom
)
_SCIPrelDiff(val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPrelDiff", 
	_SCIP_Real, 
	(_SCIP_Real, _SCIP_Real), 
	val1, val2
)
_SCIPcalcBinomCoef(n::Int, m::Int) = @scip_ccall("SCIPcalcBinomCoef", 
	Int64, 
	(Int, Int), 
	n, m
)
_SCIPprintSysError(message::String) = @scip_ccall("SCIPprintSysError", 
	Void, 
	(String,), 
	message
)
_SCIPfileExists(filename::String) = @scip_ccall("SCIPfileExists", 
	_SCIP_Bool, 
	(String,), 
	filename
)
_SCIPversion() = @scip_ccall("SCIPversion", 
	_SCIP_Real, 
	()
)
_SCIPmajorVersion() = @scip_ccall("SCIPmajorVersion", 
	Int, 
	()
)
_SCIPminorVersion() = @scip_ccall("SCIPminorVersion", 
	Int, 
	()
)
_SCIPtechVersion() = @scip_ccall("SCIPtechVersion", 
	Int, 
	()
)
_SCIPsubversion() = @scip_ccall("SCIPsubversion", 
	Int, 
	()
)
_SCIPprintError(retcode::_SCIP_RETCODE) = @scip_ccall("SCIPprintError", 
	Void, 
	(_SCIP_RETCODE,), 
	retcode
)
_SCIPstoreSolutionGap(scip::SCIP_t) = @scip_ccall("SCIPstoreSolutionGap", 
	Void, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetStage(scip::SCIP_t) = @scip_ccall("SCIPgetStage", 
	_SCIP_STAGE, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetStatus(scip::SCIP_t) = @scip_ccall("SCIPgetStatus", 
	_SCIP_STATUS, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisTransformed(scip::SCIP_t) = @scip_ccall("SCIPisTransformed", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisExactSolve(scip::SCIP_t) = @scip_ccall("SCIPisExactSolve", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisPresolveFinished(scip::SCIP_t) = @scip_ccall("SCIPisPresolveFinished", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPpressedCtrlC(scip::SCIP_t) = @scip_ccall("SCIPpressedCtrlC", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisStopped(scip::SCIP_t) = @scip_ccall("SCIPisStopped", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetMessagehdlr(scip::SCIP_t) = @scip_ccall("SCIPgetMessagehdlr", 
	Ptr{_SCIP_MESSAGEHDLR}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsetMessagehdlrLogfile(scip::SCIP_t, filename::String) = @scip_ccall("SCIPsetMessagehdlrLogfile", 
	Void, 
	(Ptr{_SCIP}, String), 
	pointer(scip), filename
)
_SCIPsetMessagehdlrQuiet(scip::SCIP_t, quiet::_SCIP_Bool) = @scip_ccall("SCIPsetMessagehdlrQuiet", 
	Void, 
	(Ptr{_SCIP}, _SCIP_Bool), 
	pointer(scip), quiet
)
_SCIPgetVerbLevel(scip::SCIP_t) = @scip_ccall("SCIPgetVerbLevel", 
	_SCIP_VERBLEVEL, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetSubscipDepth(scip::SCIP_t) = @scip_ccall("SCIPgetSubscipDepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisParamFixed(scip::SCIP_t, name::String) = @scip_ccall("SCIPisParamFixed", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetParam(scip::SCIP_t, name::String) = @scip_ccall("SCIPgetParam", 
	Ptr{_SCIP_PARAM}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetParams(scip::SCIP_t) = @scip_ccall("SCIPgetParams", 
	Ptr{Ptr{_SCIP_PARAM}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNParams(scip::SCIP_t) = @scip_ccall("SCIPgetNParams", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindReader(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindReader", 
	Ptr{_SCIP_READER}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetReaders(scip::SCIP_t) = @scip_ccall("SCIPgetReaders", 
	Ptr{Ptr{_SCIP_READER}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNReaders(scip::SCIP_t) = @scip_ccall("SCIPgetNReaders", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindPricer(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindPricer", 
	Ptr{_SCIP_PRICER}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetPricers(scip::SCIP_t) = @scip_ccall("SCIPgetPricers", 
	Ptr{Ptr{_SCIP_PRICER}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPricers(scip::SCIP_t) = @scip_ccall("SCIPgetNPricers", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNActivePricers(scip::SCIP_t) = @scip_ccall("SCIPgetNActivePricers", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindConshdlr(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindConshdlr", 
	Ptr{_SCIP_CONSHDLR}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetConshdlrs(scip::SCIP_t) = @scip_ccall("SCIPgetConshdlrs", 
	Ptr{Ptr{_SCIP_CONSHDLR}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNConshdlrs(scip::SCIP_t) = @scip_ccall("SCIPgetNConshdlrs", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindConflicthdlr(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindConflicthdlr", 
	Ptr{_SCIP_CONFLICTHDLR}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetConflicthdlrs(scip::SCIP_t) = @scip_ccall("SCIPgetConflicthdlrs", 
	Ptr{Ptr{_SCIP_CONFLICTHDLR}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNConflicthdlrs(scip::SCIP_t) = @scip_ccall("SCIPgetNConflicthdlrs", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindPresol(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindPresol", 
	Ptr{_SCIP_PRESOL}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetPresols(scip::SCIP_t) = @scip_ccall("SCIPgetPresols", 
	Ptr{Ptr{_SCIP_PRESOL}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPresols(scip::SCIP_t) = @scip_ccall("SCIPgetNPresols", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindRelax(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindRelax", 
	Ptr{_SCIP_RELAX}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetRelaxs(scip::SCIP_t) = @scip_ccall("SCIPgetRelaxs", 
	Ptr{Ptr{_SCIP_RELAX}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNRelaxs(scip::SCIP_t) = @scip_ccall("SCIPgetNRelaxs", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindSepa(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindSepa", 
	Ptr{_SCIP_SEPA}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetSepas(scip::SCIP_t) = @scip_ccall("SCIPgetSepas", 
	Ptr{Ptr{_SCIP_SEPA}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNSepas(scip::SCIP_t) = @scip_ccall("SCIPgetNSepas", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindProp(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindProp", 
	Ptr{_SCIP_PROP}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetProps(scip::SCIP_t) = @scip_ccall("SCIPgetProps", 
	Ptr{Ptr{_SCIP_PROP}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNProps(scip::SCIP_t) = @scip_ccall("SCIPgetNProps", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindHeur(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindHeur", 
	Ptr{_SCIP_HEUR}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetHeurs(scip::SCIP_t) = @scip_ccall("SCIPgetHeurs", 
	Ptr{Ptr{_SCIP_HEUR}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNHeurs(scip::SCIP_t) = @scip_ccall("SCIPgetNHeurs", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindEventhdlr(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindEventhdlr", 
	Ptr{_SCIP_EVENTHDLR}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetEventhdlrs(scip::SCIP_t) = @scip_ccall("SCIPgetEventhdlrs", 
	Ptr{Ptr{_SCIP_EVENTHDLR}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNEventhdlrs(scip::SCIP_t) = @scip_ccall("SCIPgetNEventhdlrs", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindNodesel(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindNodesel", 
	Ptr{_SCIP_NODESEL}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetNodesels(scip::SCIP_t) = @scip_ccall("SCIPgetNodesels", 
	Ptr{Ptr{_SCIP_NODESEL}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNodesels(scip::SCIP_t) = @scip_ccall("SCIPgetNNodesels", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNodesel(scip::SCIP_t) = @scip_ccall("SCIPgetNodesel", 
	Ptr{_SCIP_NODESEL}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindBranchrule(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindBranchrule", 
	Ptr{_SCIP_BRANCHRULE}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetBranchrules(scip::SCIP_t) = @scip_ccall("SCIPgetBranchrules", 
	Ptr{Ptr{_SCIP_BRANCHRULE}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNBranchrules(scip::SCIP_t) = @scip_ccall("SCIPgetNBranchrules", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindDisp(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindDisp", 
	Ptr{_SCIP_DISP}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetDisps(scip::SCIP_t) = @scip_ccall("SCIPgetDisps", 
	Ptr{Ptr{_SCIP_DISP}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNDisps(scip::SCIP_t) = @scip_ccall("SCIPgetNDisps", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindNlpi(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindNlpi", 
	Ptr{_SCIP_NLPI}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetNlpis(scip::SCIP_t) = @scip_ccall("SCIPgetNlpis", 
	Ptr{Ptr{_SCIP_NLPI}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNlpis(scip::SCIP_t) = @scip_ccall("SCIPgetNNlpis", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNExternalCodes(scip::SCIP_t) = @scip_ccall("SCIPgetNExternalCodes", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPexistsDialog(scip::SCIP_t, dialog::SCIP_DIALOG_t) = @scip_ccall("SCIPexistsDialog", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_DIALOG}), 
	pointer(scip), pointer(dialog)
)
_SCIPgetRootDialog(scip::SCIP_t) = @scip_ccall("SCIPgetRootDialog", 
	Ptr{_SCIP_DIALOG}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetProbData(scip::SCIP_t) = @scip_ccall("SCIPgetProbData", 
	Ptr{_SCIP_PROBDATA}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetProbName(scip::SCIP_t) = @scip_ccall("SCIPgetProbName", 
	String, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetObjsense(scip::SCIP_t) = @scip_ccall("SCIPgetObjsense", 
	_SCIP_OBJSENSE, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetOrigObjoffset(scip::SCIP_t) = @scip_ccall("SCIPgetOrigObjoffset", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetOrigObjscale(scip::SCIP_t) = @scip_ccall("SCIPgetOrigObjscale", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetTransObjoffset(scip::SCIP_t) = @scip_ccall("SCIPgetTransObjoffset", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetTransObjscale(scip::SCIP_t) = @scip_ccall("SCIPgetTransObjscale", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetObjlimit(scip::SCIP_t) = @scip_ccall("SCIPgetObjlimit", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisObjIntegral(scip::SCIP_t) = @scip_ccall("SCIPisObjIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetObjNorm(scip::SCIP_t) = @scip_ccall("SCIPgetObjNorm", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetVars(scip::SCIP_t) = @scip_ccall("SCIPgetVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNVars(scip::SCIP_t) = @scip_ccall("SCIPgetNVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNBinVars(scip::SCIP_t) = @scip_ccall("SCIPgetNBinVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNIntVars(scip::SCIP_t) = @scip_ccall("SCIPgetNIntVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNImplVars(scip::SCIP_t) = @scip_ccall("SCIPgetNImplVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNContVars(scip::SCIP_t) = @scip_ccall("SCIPgetNContVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNObjVars(scip::SCIP_t) = @scip_ccall("SCIPgetNObjVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetFixedVars(scip::SCIP_t) = @scip_ccall("SCIPgetFixedVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNFixedVars(scip::SCIP_t) = @scip_ccall("SCIPgetNFixedVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetOrigVars(scip::SCIP_t) = @scip_ccall("SCIPgetOrigVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNOrigVars(scip::SCIP_t) = @scip_ccall("SCIPgetNOrigVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNOrigBinVars(scip::SCIP_t) = @scip_ccall("SCIPgetNOrigBinVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNOrigIntVars(scip::SCIP_t) = @scip_ccall("SCIPgetNOrigIntVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNOrigImplVars(scip::SCIP_t) = @scip_ccall("SCIPgetNOrigImplVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNOrigContVars(scip::SCIP_t) = @scip_ccall("SCIPgetNOrigContVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNTotalVars(scip::SCIP_t) = @scip_ccall("SCIPgetNTotalVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindVar(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPallVarsInProb(scip::SCIP_t) = @scip_ccall("SCIPallVarsInProb", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfindOrigCons(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindOrigCons", 
	Ptr{_SCIP_CONS}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPfindCons(scip::SCIP_t, name::String) = @scip_ccall("SCIPfindCons", 
	Ptr{_SCIP_CONS}, 
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPgetNUpgrConss(scip::SCIP_t) = @scip_ccall("SCIPgetNUpgrConss", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNConss(scip::SCIP_t) = @scip_ccall("SCIPgetNConss", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetConss(scip::SCIP_t) = @scip_ccall("SCIPgetConss", 
	Ptr{Ptr{_SCIP_CONS}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNOrigConss(scip::SCIP_t) = @scip_ccall("SCIPgetNOrigConss", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetOrigConss(scip::SCIP_t) = @scip_ccall("SCIPgetOrigConss", 
	Ptr{Ptr{_SCIP_CONS}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNCheckConss(scip::SCIP_t) = @scip_ccall("SCIPgetNCheckConss", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLocalOrigEstimate(scip::SCIP_t) = @scip_ccall("SCIPgetLocalOrigEstimate", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLocalTransEstimate(scip::SCIP_t) = @scip_ccall("SCIPgetLocalTransEstimate", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLocalDualbound(scip::SCIP_t) = @scip_ccall("SCIPgetLocalDualbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLocalLowerbound(scip::SCIP_t) = @scip_ccall("SCIPgetLocalLowerbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNodeDualbound(scip::SCIP_t, node::SCIP_NODE_t) = @scip_ccall("SCIPgetNodeDualbound", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}), 
	pointer(scip), pointer(node)
)
_SCIPgetNodeLowerbound(scip::SCIP_t, node::SCIP_NODE_t) = @scip_ccall("SCIPgetNodeLowerbound", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}), 
	pointer(scip), pointer(node)
)
_SCIPisInRestart(scip::SCIP_t) = @scip_ccall("SCIPisInRestart", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetVarRedcost(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarRedcost", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarImplRedcost(scip::SCIP_t, var::SCIP_VAR_t, varfixing::_SCIP_Bool) = @scip_ccall("SCIPgetVarImplRedcost", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(scip), pointer(var), varfixing
)
_SCIPgetVarFarkasCoef(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarFarkasCoef", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarSol(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarSol", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPisRelaxSolValid(scip::SCIP_t) = @scip_ccall("SCIPisRelaxSolValid", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetRelaxSolVal(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetRelaxSolVal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetRelaxSolObj(scip::SCIP_t) = @scip_ccall("SCIPgetRelaxSolObj", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetVarStrongbranchNode(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarStrongbranchNode", 
	Int64, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarStrongbranchLPAge(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarStrongbranchLPAge", 
	Int64, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarNStrongbranchs(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarNStrongbranchs", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPadjustedVarLb(scip::SCIP_t, var::SCIP_VAR_t, lb::_SCIP_Real) = @scip_ccall("SCIPadjustedVarLb", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), lb
)
_SCIPadjustedVarUb(scip::SCIP_t, var::SCIP_VAR_t, ub::_SCIP_Real) = @scip_ccall("SCIPadjustedVarUb", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), ub
)
_SCIPcomputeVarLbGlobal(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPcomputeVarLbGlobal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPcomputeVarUbGlobal(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPcomputeVarUbGlobal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPcomputeVarLbLocal(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPcomputeVarLbLocal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPcomputeVarUbLocal(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPcomputeVarUbLocal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetNCliques(scip::SCIP_t) = @scip_ccall("SCIPgetNCliques", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetCliques(scip::SCIP_t) = @scip_ccall("SCIPgetCliques", 
	Ptr{Ptr{_SCIP_CLIQUE}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPhaveVarsCommonClique(scip::SCIP_t, var1::SCIP_VAR_t, value1::_SCIP_Bool, var2::SCIP_VAR_t, value2::_SCIP_Bool, regardimplics::_SCIP_Bool) = @scip_ccall("SCIPhaveVarsCommonClique", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Bool, Ptr{_SCIP_VAR}, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), pointer(var1), value1, pointer(var2), value2, regardimplics
)
_SCIPdoNotAggr(scip::SCIP_t) = @scip_ccall("SCIPdoNotAggr", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPdoNotMultaggr(scip::SCIP_t) = @scip_ccall("SCIPdoNotMultaggr", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPdoNotMultaggrVar(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPdoNotMultaggrVar", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPenableVarHistory(scip::SCIP_t) = @scip_ccall("SCIPenableVarHistory", 
	Void, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPdisableVarHistory(scip::SCIP_t) = @scip_ccall("SCIPdisableVarHistory", 
	Void, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetVarPseudocostVal(scip::SCIP_t, var::SCIP_VAR_t, solvaldelta::_SCIP_Real) = @scip_ccall("SCIPgetVarPseudocostVal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), solvaldelta
)
_SCIPgetVarPseudocostValCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, solvaldelta::_SCIP_Real) = @scip_ccall("SCIPgetVarPseudocostValCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), solvaldelta
)
_SCIPgetVarPseudocost(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarPseudocost", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarPseudocostCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarPseudocostCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarPseudocostCount(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarPseudocostCount", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarPseudocostCountCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarPseudocostCountCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarPseudocostScore(scip::SCIP_t, var::SCIP_VAR_t, solval::_SCIP_Real) = @scip_ccall("SCIPgetVarPseudocostScore", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), solval
)
_SCIPgetVarPseudocostScoreCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, solval::_SCIP_Real) = @scip_ccall("SCIPgetVarPseudocostScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), solval
)
_SCIPgetVarVSIDS(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarVSIDS", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarVSIDSCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarVSIDSCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarConflictScore(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarConflictScore", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarConflictScoreCurrentRun(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarConflictScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarConflictlengthScore(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarConflictlengthScore", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarConflictlengthScoreCurrentRun(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarConflictlengthScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarAvgConflictlength(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarAvgConflictlength", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarAvgConflictlengthCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarAvgConflictlengthCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarAvgInferences(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarAvgInferences", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarAvgInferencesCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarAvgInferencesCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarAvgInferenceScore(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarAvgInferenceScore", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarAvgInferenceScoreCurrentRun(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarAvgInferenceScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarAvgCutoffs(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarAvgCutoffs", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarAvgCutoffsCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetVarAvgCutoffsCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), dir
)
_SCIPgetVarAvgCutoffScore(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarAvgCutoffScore", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarAvgCutoffScoreCurrentRun(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarAvgCutoffScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarAvgInferenceCutoffScore(scip::SCIP_t, var::SCIP_VAR_t, cutoffweight::_SCIP_Real) = @scip_ccall("SCIPgetVarAvgInferenceCutoffScore", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), cutoffweight
)
_SCIPgetVarAvgInferenceCutoffScoreCurrentRun(scip::SCIP_t, var::SCIP_VAR_t, cutoffweight::_SCIP_Real) = @scip_ccall("SCIPgetVarAvgInferenceCutoffScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), cutoffweight
)
_SCIPisConflictAnalysisApplicable(scip::SCIP_t) = @scip_ccall("SCIPisConflictAnalysisApplicable", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetConflictVarLb(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetConflictVarLb", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetConflictVarUb(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetConflictVarUb", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPhasCurrentNodeLP(scip::SCIP_t) = @scip_ccall("SCIPhasCurrentNodeLP", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisLPConstructed(scip::SCIP_t) = @scip_ccall("SCIPisLPConstructed", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPSolstat(scip::SCIP_t) = @scip_ccall("SCIPgetLPSolstat", 
	_SCIP_LPSOLSTAT, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisLPRelax(scip::SCIP_t) = @scip_ccall("SCIPisLPRelax", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPObjval(scip::SCIP_t) = @scip_ccall("SCIPgetLPObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPColumnObjval(scip::SCIP_t) = @scip_ccall("SCIPgetLPColumnObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPLooseObjval(scip::SCIP_t) = @scip_ccall("SCIPgetLPLooseObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetGlobalPseudoObjval(scip::SCIP_t) = @scip_ccall("SCIPgetGlobalPseudoObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetPseudoObjval(scip::SCIP_t) = @scip_ccall("SCIPgetPseudoObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisRootLPRelax(scip::SCIP_t) = @scip_ccall("SCIPisRootLPRelax", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPRootObjval(scip::SCIP_t) = @scip_ccall("SCIPgetLPRootObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPRootColumnObjval(scip::SCIP_t) = @scip_ccall("SCIPgetLPRootColumnObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPRootLooseObjval(scip::SCIP_t) = @scip_ccall("SCIPgetLPRootLooseObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPCols(scip::SCIP_t) = @scip_ccall("SCIPgetLPCols", 
	Ptr{Ptr{_SCIP_COL}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPCols(scip::SCIP_t) = @scip_ccall("SCIPgetNLPCols", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPRows(scip::SCIP_t) = @scip_ccall("SCIPgetLPRows", 
	Ptr{Ptr{_SCIP_ROW}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPRows(scip::SCIP_t) = @scip_ccall("SCIPgetNLPRows", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPallColsInLP(scip::SCIP_t) = @scip_ccall("SCIPallColsInLP", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisLPSolBasic(scip::SCIP_t) = @scip_ccall("SCIPisLPSolBasic", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetColRedcost(scip::SCIP_t, col::SCIP_COL_t) = @scip_ccall("SCIPgetColRedcost", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_COL}), 
	pointer(scip), pointer(col)
)
_SCIPgetColFarkasCoef(scip::SCIP_t, col::SCIP_COL_t) = @scip_ccall("SCIPgetColFarkasCoef", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_COL}), 
	pointer(scip), pointer(col)
)
_SCIPmarkColNotRemovableLocal(scip::SCIP_t, col::SCIP_COL_t) = @scip_ccall("SCIPmarkColNotRemovableLocal", 
	Void, 
	(Ptr{_SCIP}, Ptr{_SCIP_COL}), 
	pointer(scip), pointer(col)
)
_SCIPmarkRowNotRemovableLocal(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPmarkRowNotRemovableLocal", 
	Void, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowMinCoef(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowMinCoef", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowMaxCoef(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowMaxCoef", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowMinActivity(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowMinActivity", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowMaxActivity(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowMaxActivity", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowLPActivity(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowLPActivity", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowLPFeasibility(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowLPFeasibility", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowPseudoActivity(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowPseudoActivity", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowPseudoFeasibility(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowPseudoFeasibility", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowActivity(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowActivity", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowFeasibility(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall("SCIPgetRowFeasibility", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPgetRowSolActivity(scip::SCIP_t, row::SCIP_ROW_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetRowSolActivity", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(row), pointer(sol)
)
_SCIPgetRowSolFeasibility(scip::SCIP_t, row::SCIP_ROW_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetRowSolFeasibility", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(row), pointer(sol)
)
_SCIPisNLPEnabled(scip::SCIP_t) = @scip_ccall("SCIPisNLPEnabled", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPenableNLP(scip::SCIP_t) = @scip_ccall("SCIPenableNLP", 
	Void, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisNLPConstructed(scip::SCIP_t) = @scip_ccall("SCIPisNLPConstructed", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPhasNLPContinuousNonlinearity(scip::SCIP_t) = @scip_ccall("SCIPhasNLPContinuousNonlinearity", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPVars(scip::SCIP_t) = @scip_ccall("SCIPgetNLPVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNLPVars(scip::SCIP_t) = @scip_ccall("SCIPgetNNLPVars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPVarsLbDualsol(scip::SCIP_t) = @scip_ccall("SCIPgetNLPVarsLbDualsol", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPVarsUbDualsol(scip::SCIP_t) = @scip_ccall("SCIPgetNLPVarsUbDualsol", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPNlRows(scip::SCIP_t) = @scip_ccall("SCIPgetNLPNlRows", 
	Ptr{Ptr{_SCIP_NLROW}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNLPNlRows(scip::SCIP_t) = @scip_ccall("SCIPgetNNLPNlRows", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPSolstat(scip::SCIP_t) = @scip_ccall("SCIPgetNLPSolstat", 
	_SCIP_NLPSOLSTAT, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPTermstat(scip::SCIP_t) = @scip_ccall("SCIPgetNLPTermstat", 
	_SCIP_NLPTERMSTAT, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPObjval(scip::SCIP_t) = @scip_ccall("SCIPgetNLPObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPhasNLPSolution(scip::SCIP_t) = @scip_ccall("SCIPhasNLPSolution", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetCutEfficacy(scip::SCIP_t, sol::SCIP_SOL_t, cut::SCIP_ROW_t) = @scip_ccall("SCIPgetCutEfficacy", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(sol), pointer(cut)
)
_SCIPisCutEfficacious(scip::SCIP_t, sol::SCIP_SOL_t, cut::SCIP_ROW_t) = @scip_ccall("SCIPisCutEfficacious", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(sol), pointer(cut)
)
_SCIPisEfficacious(scip::SCIP_t, efficacy::_SCIP_Real) = @scip_ccall("SCIPisEfficacious", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), efficacy
)
_SCIPgetVectorEfficacyNorm(scip::SCIP_t, vals::SCIP_Real_t, nvals::Int) = @scip_ccall("SCIPgetVectorEfficacyNorm", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_Real}, Int), 
	pointer(scip), pointer(vals), nvals
)
_SCIPisCutApplicable(scip::SCIP_t, cut::SCIP_ROW_t) = @scip_ccall("SCIPisCutApplicable", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(cut)
)
_SCIPgetPoolCuts(scip::SCIP_t) = @scip_ccall("SCIPgetPoolCuts", 
	Ptr{Ptr{_SCIP_CUT}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPoolCuts(scip::SCIP_t) = @scip_ccall("SCIPgetNPoolCuts", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetGlobalCutpool(scip::SCIP_t) = @scip_ccall("SCIPgetGlobalCutpool", 
	Ptr{_SCIP_CUTPOOL}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetDelayedPoolCuts(scip::SCIP_t) = @scip_ccall("SCIPgetDelayedPoolCuts", 
	Ptr{Ptr{_SCIP_CUT}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNDelayedPoolCuts(scip::SCIP_t) = @scip_ccall("SCIPgetNDelayedPoolCuts", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetDelayedGlobalCutpool(scip::SCIP_t) = @scip_ccall("SCIPgetDelayedGlobalCutpool", 
	Ptr{_SCIP_CUTPOOL}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetCuts(scip::SCIP_t) = @scip_ccall("SCIPgetCuts", 
	Ptr{Ptr{_SCIP_ROW}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNCuts(scip::SCIP_t) = @scip_ccall("SCIPgetNCuts", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetRelaxFeastolFactor(scip::SCIP_t) = @scip_ccall("SCIPgetRelaxFeastolFactor", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetVarObjDive(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarObjDive", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarLbDive(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarLbDive", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetVarUbDive(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetVarUbDive", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetLastDivenode(scip::SCIP_t) = @scip_ccall("SCIPgetLastDivenode", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPinDive(scip::SCIP_t) = @scip_ccall("SCIPinDive", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPinProbing(scip::SCIP_t) = @scip_ccall("SCIPinProbing", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetProbingDepth(scip::SCIP_t) = @scip_ccall("SCIPgetProbingDepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPBranchCands(scip::SCIP_t) = @scip_ccall("SCIPgetNLPBranchCands", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioLPBranchCands(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioLPBranchCands", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNExternBranchCands(scip::SCIP_t) = @scip_ccall("SCIPgetNExternBranchCands", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioExternBranchCands(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioExternBranchCands", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioExternBranchBins(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioExternBranchBins", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioExternBranchInts(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioExternBranchInts", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioExternBranchImpls(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioExternBranchImpls", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioExternBranchConts(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioExternBranchConts", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPclearExternBranchCands(scip::SCIP_t) = @scip_ccall("SCIPclearExternBranchCands", 
	Void, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcontainsExternBranchCand(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPcontainsExternBranchCand", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetNPseudoBranchCands(scip::SCIP_t) = @scip_ccall("SCIPgetNPseudoBranchCands", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioPseudoBranchCands(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioPseudoBranchCands", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioPseudoBranchBins(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioPseudoBranchBins", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioPseudoBranchInts(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioPseudoBranchInts", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrioPseudoBranchImpls(scip::SCIP_t) = @scip_ccall("SCIPgetNPrioPseudoBranchImpls", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetBranchScore(scip::SCIP_t, var::SCIP_VAR_t, downgain::_SCIP_Real, upgain::_SCIP_Real) = @scip_ccall("SCIPgetBranchScore", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), pointer(var), downgain, upgain
)
_SCIPgetBranchScoreMultiple(scip::SCIP_t, var::SCIP_VAR_t, nchildren::Int, gains::SCIP_Real_t) = @scip_ccall("SCIPgetBranchScoreMultiple", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Int, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(var), nchildren, pointer(gains)
)
_SCIPgetBranchingPoint(scip::SCIP_t, var::SCIP_VAR_t, suggestion::_SCIP_Real) = @scip_ccall("SCIPgetBranchingPoint", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), suggestion
)
_SCIPcalcNodeselPriority(scip::SCIP_t, var::SCIP_VAR_t, branchdir::_SCIP_BRANCHDIR, targetvalue::_SCIP_Real) = @scip_ccall("SCIPcalcNodeselPriority", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR, _SCIP_Real), 
	pointer(scip), pointer(var), branchdir, targetvalue
)
_SCIPcalcChildEstimate(scip::SCIP_t, var::SCIP_VAR_t, targetvalue::_SCIP_Real) = @scip_ccall("SCIPcalcChildEstimate", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), targetvalue
)
_SCIPgetSolVal(scip::SCIP_t, sol::SCIP_SOL_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetSolVal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(sol), pointer(var)
)
_SCIPgetSolOrigObj(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetSolOrigObj", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPgetSolTransObj(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetSolTransObj", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPtransformObj(scip::SCIP_t, obj::_SCIP_Real) = @scip_ccall("SCIPtransformObj", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), obj
)
_SCIPretransformObj(scip::SCIP_t, obj::_SCIP_Real) = @scip_ccall("SCIPretransformObj", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), obj
)
_SCIPgetSolTime(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetSolTime", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPgetSolRunnum(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetSolRunnum", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPgetSolNodenum(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetSolNodenum", 
	Int64, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPgetSolHeur(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetSolHeur", 
	Ptr{_SCIP_HEUR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPareSolsEqual(scip::SCIP_t, sol1::SCIP_SOL_t, sol2::SCIP_SOL_t) = @scip_ccall("SCIPareSolsEqual", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol1), pointer(sol2)
)
_SCIPgetNSols(scip::SCIP_t) = @scip_ccall("SCIPgetNSols", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetSols(scip::SCIP_t) = @scip_ccall("SCIPgetSols", 
	Ptr{Ptr{_SCIP_SOL}}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetBestSol(scip::SCIP_t) = @scip_ccall("SCIPgetBestSol", 
	Ptr{_SCIP_SOL}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPhasPrimalRay(scip::SCIP_t) = @scip_ccall("SCIPhasPrimalRay", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetPrimalRayVal(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall("SCIPgetPrimalRayVal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetCurrentNode(scip::SCIP_t) = @scip_ccall("SCIPgetCurrentNode", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetRootNode(scip::SCIP_t) = @scip_ccall("SCIPgetRootNode", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPinRepropagation(scip::SCIP_t) = @scip_ccall("SCIPinRepropagation", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNChildren(scip::SCIP_t) = @scip_ccall("SCIPgetNChildren", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNSiblings(scip::SCIP_t) = @scip_ccall("SCIPgetNSiblings", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLeaves(scip::SCIP_t) = @scip_ccall("SCIPgetNLeaves", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetPrioChild(scip::SCIP_t) = @scip_ccall("SCIPgetPrioChild", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetPrioSibling(scip::SCIP_t) = @scip_ccall("SCIPgetPrioSibling", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetBestChild(scip::SCIP_t) = @scip_ccall("SCIPgetBestChild", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetBestSibling(scip::SCIP_t) = @scip_ccall("SCIPgetBestSibling", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetBestLeaf(scip::SCIP_t) = @scip_ccall("SCIPgetBestLeaf", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetBestNode(scip::SCIP_t) = @scip_ccall("SCIPgetBestNode", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetBestboundNode(scip::SCIP_t) = @scip_ccall("SCIPgetBestboundNode", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetCutoffdepth(scip::SCIP_t) = @scip_ccall("SCIPgetCutoffdepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetRepropdepth(scip::SCIP_t) = @scip_ccall("SCIPgetRepropdepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNRuns(scip::SCIP_t) = @scip_ccall("SCIPgetNRuns", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNodes(scip::SCIP_t) = @scip_ccall("SCIPgetNNodes", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNTotalNodes(scip::SCIP_t) = @scip_ccall("SCIPgetNTotalNodes", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNodesLeft(scip::SCIP_t) = @scip_ccall("SCIPgetNNodesLeft", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNRootLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNRootLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNRootFirstLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNRootFirstLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrimalLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNPrimalLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrimalLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNPrimalLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNDualLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNDualLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNDualLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNDualLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNBarrierLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNBarrierLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNBarrierLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNBarrierLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNResolveLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNResolveLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNResolveLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNResolveLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrimalResolveLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNPrimalResolveLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPrimalResolveLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNPrimalResolveLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNDualResolveLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNDualResolveLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNDualResolveLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNDualResolveLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNodeLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNNodeLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNodeLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNNodeLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNodeInitLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNNodeInitLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNNodeInitLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNNodeInitLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNDivingLPs(scip::SCIP_t) = @scip_ccall("SCIPgetNDivingLPs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNDivingLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNDivingLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNStrongbranchs(scip::SCIP_t) = @scip_ccall("SCIPgetNStrongbranchs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNStrongbranchLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNStrongbranchLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNRootStrongbranchs(scip::SCIP_t) = @scip_ccall("SCIPgetNRootStrongbranchs", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNRootStrongbranchLPIterations(scip::SCIP_t) = @scip_ccall("SCIPgetNRootStrongbranchLPIterations", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPriceRounds(scip::SCIP_t) = @scip_ccall("SCIPgetNPriceRounds", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPricevars(scip::SCIP_t) = @scip_ccall("SCIPgetNPricevars", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPricevarsFound(scip::SCIP_t) = @scip_ccall("SCIPgetNPricevarsFound", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNPricevarsApplied(scip::SCIP_t) = @scip_ccall("SCIPgetNPricevarsApplied", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNSepaRounds(scip::SCIP_t) = @scip_ccall("SCIPgetNSepaRounds", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNCutsFound(scip::SCIP_t) = @scip_ccall("SCIPgetNCutsFound", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNCutsFoundRound(scip::SCIP_t) = @scip_ccall("SCIPgetNCutsFoundRound", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNCutsApplied(scip::SCIP_t) = @scip_ccall("SCIPgetNCutsApplied", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNConflictConssFound(scip::SCIP_t) = @scip_ccall("SCIPgetNConflictConssFound", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNConflictConssFoundNode(scip::SCIP_t) = @scip_ccall("SCIPgetNConflictConssFoundNode", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNConflictConssApplied(scip::SCIP_t) = @scip_ccall("SCIPgetNConflictConssApplied", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetDepth(scip::SCIP_t) = @scip_ccall("SCIPgetDepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetFocusDepth(scip::SCIP_t) = @scip_ccall("SCIPgetFocusDepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetMaxDepth(scip::SCIP_t) = @scip_ccall("SCIPgetMaxDepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetMaxTotalDepth(scip::SCIP_t) = @scip_ccall("SCIPgetMaxTotalDepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNBacktracks(scip::SCIP_t) = @scip_ccall("SCIPgetNBacktracks", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetPlungeDepth(scip::SCIP_t) = @scip_ccall("SCIPgetPlungeDepth", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNActiveConss(scip::SCIP_t) = @scip_ccall("SCIPgetNActiveConss", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNEnabledConss(scip::SCIP_t) = @scip_ccall("SCIPgetNEnabledConss", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgDualbound(scip::SCIP_t) = @scip_ccall("SCIPgetAvgDualbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgLowerbound(scip::SCIP_t) = @scip_ccall("SCIPgetAvgLowerbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetDualbound(scip::SCIP_t) = @scip_ccall("SCIPgetDualbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLowerbound(scip::SCIP_t) = @scip_ccall("SCIPgetLowerbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetDualboundRoot(scip::SCIP_t) = @scip_ccall("SCIPgetDualboundRoot", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLowerboundRoot(scip::SCIP_t) = @scip_ccall("SCIPgetLowerboundRoot", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetFirstLPDualboundRoot(scip::SCIP_t) = @scip_ccall("SCIPgetFirstLPDualboundRoot", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetFirstLPLowerboundRoot(scip::SCIP_t) = @scip_ccall("SCIPgetFirstLPLowerboundRoot", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetPrimalbound(scip::SCIP_t) = @scip_ccall("SCIPgetPrimalbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetUpperbound(scip::SCIP_t) = @scip_ccall("SCIPgetUpperbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetCutoffbound(scip::SCIP_t) = @scip_ccall("SCIPgetCutoffbound", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisPrimalboundSol(scip::SCIP_t) = @scip_ccall("SCIPisPrimalboundSol", 
	_SCIP_Bool, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetGap(scip::SCIP_t) = @scip_ccall("SCIPgetGap", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetTransGap(scip::SCIP_t) = @scip_ccall("SCIPgetTransGap", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNSolsFound(scip::SCIP_t) = @scip_ccall("SCIPgetNSolsFound", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLimSolsFound(scip::SCIP_t) = @scip_ccall("SCIPgetNLimSolsFound", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNBestSolsFound(scip::SCIP_t) = @scip_ccall("SCIPgetNBestSolsFound", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgPseudocost(scip::SCIP_t, solvaldelta::_SCIP_Real) = @scip_ccall("SCIPgetAvgPseudocost", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), solvaldelta
)
_SCIPgetAvgPseudocostCurrentRun(scip::SCIP_t, solvaldelta::_SCIP_Real) = @scip_ccall("SCIPgetAvgPseudocostCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), solvaldelta
)
_SCIPgetAvgPseudocostCount(scip::SCIP_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetAvgPseudocostCount", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_BRANCHDIR), 
	pointer(scip), dir
)
_SCIPgetAvgPseudocostCountCurrentRun(scip::SCIP_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetAvgPseudocostCountCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_BRANCHDIR), 
	pointer(scip), dir
)
_SCIPgetAvgPseudocostScore(scip::SCIP_t) = @scip_ccall("SCIPgetAvgPseudocostScore", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgPseudocostScoreCurrentRun(scip::SCIP_t) = @scip_ccall("SCIPgetAvgPseudocostScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgConflictScore(scip::SCIP_t) = @scip_ccall("SCIPgetAvgConflictScore", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgConflictScoreCurrentRun(scip::SCIP_t) = @scip_ccall("SCIPgetAvgConflictScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgConflictlengthScore(scip::SCIP_t) = @scip_ccall("SCIPgetAvgConflictlengthScore", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgConflictlengthScoreCurrentRun(scip::SCIP_t) = @scip_ccall("SCIPgetAvgConflictlengthScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgInferences(scip::SCIP_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetAvgInferences", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_BRANCHDIR), 
	pointer(scip), dir
)
_SCIPgetAvgInferencesCurrentRun(scip::SCIP_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetAvgInferencesCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_BRANCHDIR), 
	pointer(scip), dir
)
_SCIPgetAvgInferenceScore(scip::SCIP_t) = @scip_ccall("SCIPgetAvgInferenceScore", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgInferenceScoreCurrentRun(scip::SCIP_t) = @scip_ccall("SCIPgetAvgInferenceScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgCutoffs(scip::SCIP_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetAvgCutoffs", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_BRANCHDIR), 
	pointer(scip), dir
)
_SCIPgetAvgCutoffsCurrentRun(scip::SCIP_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPgetAvgCutoffsCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_BRANCHDIR), 
	pointer(scip), dir
)
_SCIPgetAvgCutoffScore(scip::SCIP_t) = @scip_ccall("SCIPgetAvgCutoffScore", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetAvgCutoffScoreCurrentRun(scip::SCIP_t) = @scip_ccall("SCIPgetAvgCutoffScoreCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNImplications(scip::SCIP_t) = @scip_ccall("SCIPgetNImplications", 
	Int, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetTimeOfDay(scip::SCIP_t) = @scip_ccall("SCIPgetTimeOfDay", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetClockTime(scip::SCIP_t, clck::SCIP_CLOCK_t) = @scip_ccall("SCIPgetClockTime", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CLOCK}), 
	pointer(scip), pointer(clck)
)
_SCIPgetTotalTime(scip::SCIP_t) = @scip_ccall("SCIPgetTotalTime", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetSolvingTime(scip::SCIP_t) = @scip_ccall("SCIPgetSolvingTime", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetReadingTime(scip::SCIP_t) = @scip_ccall("SCIPgetReadingTime", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetPresolvingTime(scip::SCIP_t) = @scip_ccall("SCIPgetPresolvingTime", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetFirstLPTime(scip::SCIP_t) = @scip_ccall("SCIPgetFirstLPTime", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPepsilon(scip::SCIP_t) = @scip_ccall("SCIPepsilon", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsumepsilon(scip::SCIP_t) = @scip_ccall("SCIPsumepsilon", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfeastol(scip::SCIP_t) = @scip_ccall("SCIPfeastol", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPlpfeastol(scip::SCIP_t) = @scip_ccall("SCIPlpfeastol", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPdualfeastol(scip::SCIP_t) = @scip_ccall("SCIPdualfeastol", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPbarrierconvtol(scip::SCIP_t) = @scip_ccall("SCIPbarrierconvtol", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcutoffbounddelta(scip::SCIP_t) = @scip_ccall("SCIPcutoffbounddelta", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPmarkLimitChanged(scip::SCIP_t) = @scip_ccall("SCIPmarkLimitChanged", 
	Void, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPinfinity(scip::SCIP_t) = @scip_ccall("SCIPinfinity", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetHugeValue(scip::SCIP_t) = @scip_ccall("SCIPgetHugeValue", 
	_SCIP_Real, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPisEQ(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisEQ", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisLT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisLT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisLE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisLE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisGT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisGT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisGE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisGE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisInfinity(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisInfinity", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisHugeValue(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisHugeValue", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisZero(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisZero", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisPositive(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisPositive", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisNegative(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisNegative", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisIntegral(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisScalingIntegral(scip::SCIP_t, val::_SCIP_Real, scalar::_SCIP_Real) = @scip_ccall("SCIPisScalingIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val, scalar
)
_SCIPisFracIntegral(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisFracIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPfloor(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPfloor", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPceil(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPceil", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPround(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPround", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPfrac(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPfrac", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisSumEQ(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumEQ", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumLT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumLT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumLE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumLE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumGT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumGT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumGE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumGE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumZero(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisSumZero", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisSumPositive(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisSumPositive", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisSumNegative(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisSumNegative", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisFeasEQ(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisFeasEQ", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisFeasLT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisFeasLT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisFeasLE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisFeasLE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisFeasGT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisFeasGT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisFeasGE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisFeasGE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisFeasZero(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisFeasZero", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisFeasPositive(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisFeasPositive", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisFeasNegative(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisFeasNegative", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisFeasIntegral(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisFeasIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisFeasFracIntegral(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPisFeasFracIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPfeasFloor(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPfeasFloor", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPfeasCeil(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPfeasCeil", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPfeasRound(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPfeasRound", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPfeasFrac(scip::SCIP_t, val::_SCIP_Real) = @scip_ccall("SCIPfeasFrac", 
	_SCIP_Real, 
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), val
)
_SCIPisLbBetter(scip::SCIP_t, newlb::_SCIP_Real, oldlb::_SCIP_Real, oldub::_SCIP_Real) = @scip_ccall("SCIPisLbBetter", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real, _SCIP_Real), 
	pointer(scip), newlb, oldlb, oldub
)
_SCIPisUbBetter(scip::SCIP_t, newub::_SCIP_Real, oldlb::_SCIP_Real, oldub::_SCIP_Real) = @scip_ccall("SCIPisUbBetter", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real, _SCIP_Real), 
	pointer(scip), newub, oldlb, oldub
)
_SCIPisRelEQ(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisRelEQ", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisRelLT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisRelLT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisRelLE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisRelLE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisRelGT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisRelGT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisRelGE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisRelGE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumRelEQ(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumRelEQ", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumRelLT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumRelLT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumRelLE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumRelLE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumRelGT(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumRelGT", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisSumRelGE(scip::SCIP_t, val1::_SCIP_Real, val2::_SCIP_Real) = @scip_ccall("SCIPisSumRelGE", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), val1, val2
)
_SCIPisUpdateUnreliable(scip::SCIP_t, newvalue::_SCIP_Real, oldvalue::_SCIP_Real) = @scip_ccall("SCIPisUpdateUnreliable", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), newvalue, oldvalue
)
_SCIPgetMemUsed(scip::SCIP_t) = @scip_ccall("SCIPgetMemUsed", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetMemExternEstim(scip::SCIP_t) = @scip_ccall("SCIPgetMemExternEstim", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcalcMemGrowSize(scip::SCIP_t, num::Int) = @scip_ccall("SCIPcalcMemGrowSize", 
	Int, 
	(Ptr{_SCIP}, Int), 
	pointer(scip), num
)
_SCIPprintMemoryDiagnostic(scip::SCIP_t) = @scip_ccall("SCIPprintMemoryDiagnostic", 
	Void, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetRealarrayVal(scip::SCIP_t, realarray::SCIP_REALARRAY_t, idx::Int) = @scip_ccall("SCIPgetRealarrayVal", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_REALARRAY}, Int), 
	pointer(scip), pointer(realarray), idx
)
_SCIPgetRealarrayMinIdx(scip::SCIP_t, realarray::SCIP_REALARRAY_t) = @scip_ccall("SCIPgetRealarrayMinIdx", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_REALARRAY}), 
	pointer(scip), pointer(realarray)
)
_SCIPgetRealarrayMaxIdx(scip::SCIP_t, realarray::SCIP_REALARRAY_t) = @scip_ccall("SCIPgetRealarrayMaxIdx", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_REALARRAY}), 
	pointer(scip), pointer(realarray)
)
_SCIPgetIntarrayVal(scip::SCIP_t, intarray::SCIP_INTARRAY_t, idx::Int) = @scip_ccall("SCIPgetIntarrayVal", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_INTARRAY}, Int), 
	pointer(scip), pointer(intarray), idx
)
_SCIPgetIntarrayMinIdx(scip::SCIP_t, intarray::SCIP_INTARRAY_t) = @scip_ccall("SCIPgetIntarrayMinIdx", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_INTARRAY}), 
	pointer(scip), pointer(intarray)
)
_SCIPgetIntarrayMaxIdx(scip::SCIP_t, intarray::SCIP_INTARRAY_t) = @scip_ccall("SCIPgetIntarrayMaxIdx", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_INTARRAY}), 
	pointer(scip), pointer(intarray)
)
_SCIPgetBoolarrayVal(scip::SCIP_t, boolarray::SCIP_BOOLARRAY_t, idx::Int) = @scip_ccall("SCIPgetBoolarrayVal", 
	_SCIP_Bool, 
	(Ptr{_SCIP}, Ptr{_SCIP_BOOLARRAY}, Int), 
	pointer(scip), pointer(boolarray), idx
)
_SCIPgetBoolarrayMinIdx(scip::SCIP_t, boolarray::SCIP_BOOLARRAY_t) = @scip_ccall("SCIPgetBoolarrayMinIdx", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_BOOLARRAY}), 
	pointer(scip), pointer(boolarray)
)
_SCIPgetBoolarrayMaxIdx(scip::SCIP_t, boolarray::SCIP_BOOLARRAY_t) = @scip_ccall("SCIPgetBoolarrayMaxIdx", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_BOOLARRAY}), 
	pointer(scip), pointer(boolarray)
)
_SCIPgetPtrarrayMinIdx(scip::SCIP_t, ptrarray::SCIP_PTRARRAY_t) = @scip_ccall("SCIPgetPtrarrayMinIdx", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_PTRARRAY}), 
	pointer(scip), pointer(ptrarray)
)
_SCIPgetPtrarrayMaxIdx(scip::SCIP_t, ptrarray::SCIP_PTRARRAY_t) = @scip_ccall("SCIPgetPtrarrayMaxIdx", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_PTRARRAY}), 
	pointer(scip), pointer(ptrarray)
)
_SCIPgetNCountedSols(scip::SCIP_t, valid::SCIP_Bool_t) = @scip_ccall("SCIPgetNCountedSols", 
	Int64, 
	(Ptr{_SCIP}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(valid)
)
_SCIPgetNCountedFeasSubtrees(scip::SCIP_t) = @scip_ccall("SCIPgetNCountedFeasSubtrees", 
	Int64, 
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNVarsLogicor(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsLogicor", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsLogicor(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsLogicor", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualsolLogicor(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualsolLogicor", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualfarkasLogicor(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualfarkasLogicor", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRowLogicor(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRowLogicor", 
	Ptr{_SCIP_ROW}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPeventhdlrGetName(eventhdlr::SCIP_EVENTHDLR_t) = @scip_ccall("SCIPeventhdlrGetName", 
	String, 
	(Ptr{_SCIP_EVENTHDLR},), 
	pointer(eventhdlr)
)
_SCIPeventhdlrGetData(eventhdlr::SCIP_EVENTHDLR_t) = @scip_ccall("SCIPeventhdlrGetData", 
	Ptr{_SCIP_EVENTHDLRDATA}, 
	(Ptr{_SCIP_EVENTHDLR},), 
	pointer(eventhdlr)
)
_SCIPeventhdlrSetData(eventhdlr::SCIP_EVENTHDLR_t, eventhdlrdata::SCIP_EVENTHDLRDATA_t) = @scip_ccall("SCIPeventhdlrSetData", 
	Void, 
	(Ptr{_SCIP_EVENTHDLR}, Ptr{_SCIP_EVENTHDLRDATA}), 
	pointer(eventhdlr), pointer(eventhdlrdata)
)
_SCIPeventhdlrIsInitialized(eventhdlr::SCIP_EVENTHDLR_t) = @scip_ccall("SCIPeventhdlrIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_EVENTHDLR},), 
	pointer(eventhdlr)
)
_SCIPeventhdlrGetSetupTime(eventhdlr::SCIP_EVENTHDLR_t) = @scip_ccall("SCIPeventhdlrGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENTHDLR},), 
	pointer(eventhdlr)
)
_SCIPeventhdlrGetTime(eventhdlr::SCIP_EVENTHDLR_t) = @scip_ccall("SCIPeventhdlrGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENTHDLR},), 
	pointer(eventhdlr)
)
_SCIPeventGetType(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetType", 
	_SCIP_EVENTTYPE, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetVar(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetOldobj(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetOldobj", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetNewobj(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetNewobj", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetOldbound(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetOldbound", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetNewbound(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetNewbound", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetNode(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetNode", 
	Ptr{_SCIP_NODE}, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetSol(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetSol", 
	Ptr{_SCIP_SOL}, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetHoleLeft(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetHoleLeft", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetHoleRight(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetHoleRight", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRow(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRow", 
	Ptr{_SCIP_ROW}, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRowCol(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRowCol", 
	Ptr{_SCIP_COL}, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRowOldCoefVal(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRowOldCoefVal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRowNewCoefVal(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRowNewCoefVal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRowOldConstVal(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRowOldConstVal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRowNewConstVal(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRowNewConstVal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRowSide(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRowSide", 
	_SCIP_SIDETYPE, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRowOldSideVal(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRowOldSideVal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPeventGetRowNewSideVal(event::SCIP_EVENT_t) = @scip_ccall("SCIPeventGetRowNewSideVal", 
	_SCIP_Real, 
	(Ptr{_SCIP_EVENT},), 
	pointer(event)
)
_SCIPgetNLinearVarsNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNLinearVarsNonlinear", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLinearVarsNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLinearVarsNonlinear", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLinearCoefsNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLinearCoefsNonlinear", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNExprtreesNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNExprtreesNonlinear", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetExprtreesNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetExprtreesNonlinear", 
	Ptr{Ptr{_SCIP_EXPRTREE}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetExprtreeCoefsNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetExprtreeCoefsNonlinear", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetExprgraphNodeNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetExprgraphNodeNonlinear", 
	Ptr{_SCIP_EXPRGRAPHNODE}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsNonlinear", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsNonlinear", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetExprgraphNonlinear(scip::SCIP_t, conshdlr::SCIP_CONSHDLR_t) = @scip_ccall("SCIPgetExprgraphNonlinear", 
	Ptr{_SCIP_EXPRGRAPH}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONSHDLR}), 
	pointer(scip), pointer(conshdlr)
)
_SCIPgetNVarsSetppc(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsSetppc", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsSetppc(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsSetppc", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetTypeSetppc(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetTypeSetppc", 
	_SCIP_SETPPCTYPE, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualsolSetppc(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualsolSetppc", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetDualfarkasSetppc(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetDualfarkasSetppc", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRowSetppc(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRowSetppc", 
	Ptr{_SCIP_ROW}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNFixedonesSetppc(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNFixedonesSetppc", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNFixedzerosSetppc(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNFixedzerosSetppc", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPparamGetType(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetType", 
	_SCIP_PARAMTYPE, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetName(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetName", 
	String, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetDesc(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetDesc", 
	String, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetData(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetData", 
	Ptr{_SCIP_PARAMDATA}, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamIsAdvanced(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamIsAdvanced", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamIsFixed(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamIsFixed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamSetFixed(param::SCIP_PARAM_t, fixed::_SCIP_Bool) = @scip_ccall("SCIPparamSetFixed", 
	Void, 
	(Ptr{_SCIP_PARAM}, _SCIP_Bool), 
	pointer(param), fixed
)
_SCIPparamGetBool(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetBool", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetBoolDefault(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetBoolDefault", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetInt(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetInt", 
	Int, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetIntMin(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetIntMin", 
	Int, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetIntMax(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetIntMax", 
	Int, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetIntDefault(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetIntDefault", 
	Int, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetLongint(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetLongint", 
	Int64, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetLongintMin(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetLongintMin", 
	Int64, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetLongintMax(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetLongintMax", 
	Int64, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetLongintDefault(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetLongintDefault", 
	Int64, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetReal(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetReal", 
	_SCIP_Real, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetRealMin(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetRealMin", 
	_SCIP_Real, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetRealMax(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetRealMax", 
	_SCIP_Real, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetRealDefault(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetRealDefault", 
	_SCIP_Real, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetChar(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetChar", 
	Char, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamGetCharDefault(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamGetCharDefault", 
	Char, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPparamIsDefault(param::SCIP_PARAM_t) = @scip_ccall("SCIPparamIsDefault", 
	_SCIP_Bool, 
	(Ptr{_SCIP_PARAM},), 
	pointer(param)
)
_SCIPdialoghdlrGetRoot(dialoghdlr::SCIP_DIALOGHDLR_t) = @scip_ccall("SCIPdialoghdlrGetRoot", 
	Ptr{_SCIP_DIALOG}, 
	(Ptr{_SCIP_DIALOGHDLR},), 
	pointer(dialoghdlr)
)
_SCIPdialoghdlrClearBuffer(dialoghdlr::SCIP_DIALOGHDLR_t) = @scip_ccall("SCIPdialoghdlrClearBuffer", 
	Void, 
	(Ptr{_SCIP_DIALOGHDLR},), 
	pointer(dialoghdlr)
)
_SCIPdialoghdlrIsBufferEmpty(dialoghdlr::SCIP_DIALOGHDLR_t) = @scip_ccall("SCIPdialoghdlrIsBufferEmpty", 
	_SCIP_Bool, 
	(Ptr{_SCIP_DIALOGHDLR},), 
	pointer(dialoghdlr)
)
_SCIPdialogHasEntry(dialog::SCIP_DIALOG_t, entryname::String) = @scip_ccall("SCIPdialogHasEntry", 
	_SCIP_Bool, 
	(Ptr{_SCIP_DIALOG}, String), 
	pointer(dialog), entryname
)
_SCIPdialogFindEntry(dialog::SCIP_DIALOG_t, entryname::String, subdialog::SCIP_DIALOG_t) = @scip_ccall("SCIPdialogFindEntry", 
	Int, 
	(Ptr{_SCIP_DIALOG}, String, Ptr{Ptr{_SCIP_DIALOG}}), 
	pointer(dialog), entryname, array(subdialog)
)
_SCIPdialogGetName(dialog::SCIP_DIALOG_t) = @scip_ccall("SCIPdialogGetName", 
	String, 
	(Ptr{_SCIP_DIALOG},), 
	pointer(dialog)
)
_SCIPdialogGetDesc(dialog::SCIP_DIALOG_t) = @scip_ccall("SCIPdialogGetDesc", 
	String, 
	(Ptr{_SCIP_DIALOG},), 
	pointer(dialog)
)
_SCIPdialogIsSubmenu(dialog::SCIP_DIALOG_t) = @scip_ccall("SCIPdialogIsSubmenu", 
	_SCIP_Bool, 
	(Ptr{_SCIP_DIALOG},), 
	pointer(dialog)
)
_SCIPdialogGetParent(dialog::SCIP_DIALOG_t) = @scip_ccall("SCIPdialogGetParent", 
	Ptr{_SCIP_DIALOG}, 
	(Ptr{_SCIP_DIALOG},), 
	pointer(dialog)
)
_SCIPdialogGetSubdialogs(dialog::SCIP_DIALOG_t) = @scip_ccall("SCIPdialogGetSubdialogs", 
	Ptr{Ptr{_SCIP_DIALOG}}, 
	(Ptr{_SCIP_DIALOG},), 
	pointer(dialog)
)
_SCIPdialogGetNSubdialogs(dialog::SCIP_DIALOG_t) = @scip_ccall("SCIPdialogGetNSubdialogs", 
	Int, 
	(Ptr{_SCIP_DIALOG},), 
	pointer(dialog)
)
_SCIPdialogGetData(dialog::SCIP_DIALOG_t) = @scip_ccall("SCIPdialogGetData", 
	Ptr{_SCIP_DIALOGDATA}, 
	(Ptr{_SCIP_DIALOG},), 
	pointer(dialog)
)
_SCIPdialogSetData(dialog::SCIP_DIALOG_t, dialogdata::SCIP_DIALOGDATA_t) = @scip_ccall("SCIPdialogSetData", 
	Void, 
	(Ptr{_SCIP_DIALOG}, Ptr{_SCIP_DIALOGDATA}), 
	pointer(dialog), pointer(dialogdata)
)
_SCIPsepaGetData(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetData", 
	Ptr{_SCIP_SEPADATA}, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaSetData(sepa::SCIP_SEPA_t, sepadata::SCIP_SEPADATA_t) = @scip_ccall("SCIPsepaSetData", 
	Void, 
	(Ptr{_SCIP_SEPA}, Ptr{_SCIP_SEPADATA}), 
	pointer(sepa), pointer(sepadata)
)
_SCIPsepaGetName(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetName", 
	String, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetDesc(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetDesc", 
	String, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetPriority(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetPriority", 
	Int, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetFreq(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetFreq", 
	Int, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaSetFreq(sepa::SCIP_SEPA_t, freq::Int) = @scip_ccall("SCIPsepaSetFreq", 
	Void, 
	(Ptr{_SCIP_SEPA}, Int), 
	pointer(sepa), freq
)
_SCIPsepaGetMaxbounddist(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetMaxbounddist", 
	_SCIP_Real, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaUsesSubscip(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaUsesSubscip", 
	_SCIP_Bool, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetSetupTime(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetTime(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetNCalls(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetNCalls", 
	Int64, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetNCallsAtNode(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetNCallsAtNode", 
	Int, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetNCutoffs(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetNCutoffs", 
	Int64, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetNCutsFound(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetNCutsFound", 
	Int64, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetNCutsApplied(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetNCutsApplied", 
	Int64, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetNCutsFoundAtNode(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetNCutsFoundAtNode", 
	Int64, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetNConssFound(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetNConssFound", 
	Int64, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaGetNDomredsFound(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaGetNDomredsFound", 
	Int64, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaIsDelayed(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaIsDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaWasLPDelayed(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaWasLPDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaWasSolDelayed(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaWasSolDelayed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPsepaIsInitialized(sepa::SCIP_SEPA_t) = @scip_ccall("SCIPsepaIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_SEPA},), 
	pointer(sepa)
)
_SCIPvarGetNLocksDown(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNLocksDown", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNLocksUp(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNLocksUp", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarMayRoundDown(var::SCIP_VAR_t) = @scip_ccall("SCIPvarMayRoundDown", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarMayRoundUp(var::SCIP_VAR_t) = @scip_ccall("SCIPvarMayRoundUp", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarCompareActiveAndNegated(var1::SCIP_VAR_t, var2::SCIP_VAR_t) = @scip_ccall("SCIPvarCompareActiveAndNegated", 
	Int, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}), 
	pointer(var1), pointer(var2)
)
_SCIPvarCompare(var1::SCIP_VAR_t, var2::SCIP_VAR_t) = @scip_ccall("SCIPvarCompare", 
	Int, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}), 
	pointer(var1), pointer(var2)
)
_SCIPvarsGetProbvar(vars::SCIP_VAR_t, nvars::Int) = @scip_ccall("SCIPvarsGetProbvar", 
	Void, 
	(Ptr{Ptr{_SCIP_VAR}}, Int), 
	array(vars), nvars
)
_SCIPvarGetProbvar(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetProbvar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsTransformedOrigvar(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsTransformedOrigvar", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNBranchings(var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPvarGetNBranchings", 
	Int64, 
	(Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(var), dir
)
_SCIPvarGetNBranchingsCurrentRun(var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPvarGetNBranchingsCurrentRun", 
	Int64, 
	(Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(var), dir
)
_SCIPvarGetInferenceSum(var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPvarGetInferenceSum", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(var), dir
)
_SCIPvarGetInferenceSumCurrentRun(var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPvarGetInferenceSumCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(var), dir
)
_SCIPvarGetCutoffSum(var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPvarGetCutoffSum", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(var), dir
)
_SCIPvarGetCutoffSumCurrentRun(var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPvarGetCutoffSumCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(var), dir
)
_SCIPvarGetAvgBranchdepth(var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPvarGetAvgBranchdepth", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(var), dir
)
_SCIPvarGetAvgBranchdepthCurrentRun(var::SCIP_VAR_t, dir::_SCIP_BRANCHDIR) = @scip_ccall("SCIPvarGetAvgBranchdepthCurrentRun", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(var), dir
)
_SCIPvarHasImplic(var::SCIP_VAR_t, varfixing::_SCIP_Bool, implvar::SCIP_VAR_t, impltype::_SCIP_BOUNDTYPE) = @scip_ccall("SCIPvarHasImplic", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool, Ptr{_SCIP_VAR}, _SCIP_BOUNDTYPE), 
	pointer(var), varfixing, pointer(implvar), impltype
)
_SCIPvarHasBinaryImplic(var::SCIP_VAR_t, varfixing::_SCIP_Bool, implvar::SCIP_VAR_t, implvarfixing::_SCIP_Bool) = @scip_ccall("SCIPvarHasBinaryImplic", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool, Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), varfixing, pointer(implvar), implvarfixing
)
_SCIPvarsHaveCommonClique(var1::SCIP_VAR_t, value1::_SCIP_Bool, var2::SCIP_VAR_t, value2::_SCIP_Bool, regardimplics::_SCIP_Bool) = @scip_ccall("SCIPvarsHaveCommonClique", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool, Ptr{_SCIP_VAR}, _SCIP_Bool, _SCIP_Bool), 
	pointer(var1), value1, pointer(var2), value2, regardimplics
)
_SCIPvarGetName(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetName", 
	String, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNUses(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNUses", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetData(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetData", 
	Ptr{_SCIP_VARDATA}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarSetData(var::SCIP_VAR_t, vardata::SCIP_VARDATA_t) = @scip_ccall("SCIPvarSetData", 
	Void, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_VARDATA}), 
	pointer(var), pointer(vardata)
)
_SCIPvarGetStatus(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetStatus", 
	_SCIP_VARSTATUS, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsOriginal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsOriginal", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsTransformed(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsTransformed", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsNegated(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsNegated", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetType(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetType", 
	_SCIP_VARTYPE, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsBinary(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsBinary", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsIntegral(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsIntegral", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsInitial(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsInitial", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsRemovable(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsRemovable", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsDeleted(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsDeleted", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarMarkDeletable(var::SCIP_VAR_t) = @scip_ccall("SCIPvarMarkDeletable", 
	Void, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarMarkNotDeletable(var::SCIP_VAR_t) = @scip_ccall("SCIPvarMarkNotDeletable", 
	Void, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsDeletable(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsDeletable", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsActive(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsActive", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetIndex(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetIndex", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetProbindex(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetProbindex", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetTransVar(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetTransVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetCol(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetCol", 
	Ptr{_SCIP_COL}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarIsInLP(var::SCIP_VAR_t) = @scip_ccall("SCIPvarIsInLP", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetAggrVar(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetAggrVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetAggrScalar(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetAggrScalar", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetAggrConstant(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetAggrConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetMultaggrNVars(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetMultaggrNVars", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetMultaggrVars(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetMultaggrVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetMultaggrScalars(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetMultaggrScalars", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetMultaggrConstant(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetMultaggrConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNegatedVar(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNegatedVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNegationVar(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNegationVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNegationConstant(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNegationConstant", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetObj(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetObj", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetLbOriginal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetLbOriginal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetUbOriginal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetUbOriginal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetHolelistOriginal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetHolelistOriginal", 
	Ptr{_SCIP_HOLELIST}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetLbGlobal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetLbGlobal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetUbGlobal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetUbGlobal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetHolelistGlobal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetHolelistGlobal", 
	Ptr{_SCIP_HOLELIST}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBestBoundGlobal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBestBoundGlobal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetWorstBoundGlobal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetWorstBoundGlobal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetLbLocal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetLbLocal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetUbLocal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetUbLocal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetHolelistLocal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetHolelistLocal", 
	Ptr{_SCIP_HOLELIST}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBestBoundLocal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBestBoundLocal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetWorstBoundLocal(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetWorstBoundLocal", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBestBoundType(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBestBoundType", 
	_SCIP_BOUNDTYPE, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetWorstBoundType(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetWorstBoundType", 
	_SCIP_BOUNDTYPE, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetLbLazy(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetLbLazy", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetUbLazy(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetUbLazy", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBranchFactor(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBranchFactor", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBranchPriority(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBranchPriority", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBranchDirection(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBranchDirection", 
	_SCIP_BRANCHDIR, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNVlbs(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNVlbs", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetVlbVars(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetVlbVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetVlbCoefs(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetVlbCoefs", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetVlbConstants(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetVlbConstants", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNVubs(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNVubs", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetVubVars(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetVubVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetVubCoefs(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetVubCoefs", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetVubConstants(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetVubConstants", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNImpls(var::SCIP_VAR_t, varfixing::_SCIP_Bool) = @scip_ccall("SCIPvarGetNImpls", 
	Int, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), varfixing
)
_SCIPvarGetNBinImpls(var::SCIP_VAR_t, varfixing::_SCIP_Bool) = @scip_ccall("SCIPvarGetNBinImpls", 
	Int, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), varfixing
)
_SCIPvarGetImplVars(var::SCIP_VAR_t, varfixing::_SCIP_Bool) = @scip_ccall("SCIPvarGetImplVars", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), varfixing
)
_SCIPvarGetImplTypes(var::SCIP_VAR_t, varfixing::_SCIP_Bool) = @scip_ccall("SCIPvarGetImplTypes", 
	Ptr{_SCIP_BOUNDTYPE}, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), varfixing
)
_SCIPvarGetImplBounds(var::SCIP_VAR_t, varfixing::_SCIP_Bool) = @scip_ccall("SCIPvarGetImplBounds", 
	Ptr{_SCIP_Real}, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), varfixing
)
_SCIPvarGetNCliques(var::SCIP_VAR_t, varfixing::_SCIP_Bool) = @scip_ccall("SCIPvarGetNCliques", 
	Int, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), varfixing
)
_SCIPvarGetCliques(var::SCIP_VAR_t, varfixing::_SCIP_Bool) = @scip_ccall("SCIPvarGetCliques", 
	Ptr{Ptr{_SCIP_CLIQUE}}, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), varfixing
)
_SCIPvarGetLPSol(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetLPSol", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNLPSol(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNLPSol", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBdchgInfoLb(var::SCIP_VAR_t, pos::Int) = @scip_ccall("SCIPvarGetBdchgInfoLb", 
	Ptr{_SCIP_BDCHGINFO}, 
	(Ptr{_SCIP_VAR}, Int), 
	pointer(var), pos
)
_SCIPvarGetNBdchgInfosLb(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNBdchgInfosLb", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBdchgInfoUb(var::SCIP_VAR_t, pos::Int) = @scip_ccall("SCIPvarGetBdchgInfoUb", 
	Ptr{_SCIP_BDCHGINFO}, 
	(Ptr{_SCIP_VAR}, Int), 
	pointer(var), pos
)
_SCIPvarGetNBdchgInfosUb(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNBdchgInfosUb", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetValuehistory(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetValuehistory", 
	Ptr{_SCIP_VALUEHISTORY}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetLPSol_rec(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetLPSol_rec", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetNLPSol_rec(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetNLPSol_rec", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetPseudoSol(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetPseudoSol", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetSol(var::SCIP_VAR_t, getlpval::_SCIP_Bool) = @scip_ccall("SCIPvarGetSol", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), getlpval
)
_SCIPvarGetRootSol(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetRootSol", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBestRootSol(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBestRootSol", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBestRootRedcost(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBestRootRedcost", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetBestRootLPObjval(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetBestRootLPObjval", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarSetBestRootSol(var::SCIP_VAR_t, rootsol::_SCIP_Real, rootredcost::_SCIP_Real, rootlpobjval::_SCIP_Real) = @scip_ccall("SCIPvarSetBestRootSol", 
	Void, 
	(Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real), 
	pointer(var), rootsol, rootredcost, rootlpobjval
)
_SCIPvarGetAvgSol(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetAvgSol", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetLbchgInfo(var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t, after::_SCIP_Bool) = @scip_ccall("SCIPvarGetLbchgInfo", 
	Ptr{_SCIP_BDCHGINFO}, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}, _SCIP_Bool), 
	pointer(var), pointer(bdchgidx), after
)
_SCIPvarGetUbchgInfo(var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t, after::_SCIP_Bool) = @scip_ccall("SCIPvarGetUbchgInfo", 
	Ptr{_SCIP_BDCHGINFO}, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}, _SCIP_Bool), 
	pointer(var), pointer(bdchgidx), after
)
_SCIPvarGetBdchgInfo(var::SCIP_VAR_t, boundtype::_SCIP_BOUNDTYPE, bdchgidx::SCIP_BDCHGIDX_t, after::_SCIP_Bool) = @scip_ccall("SCIPvarGetBdchgInfo", 
	Ptr{_SCIP_BDCHGINFO}, 
	(Ptr{_SCIP_VAR}, _SCIP_BOUNDTYPE, Ptr{_SCIP_BDCHGIDX}, _SCIP_Bool), 
	pointer(var), boundtype, pointer(bdchgidx), after
)
_SCIPvarGetLbAtIndex(var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t, after::_SCIP_Bool) = @scip_ccall("SCIPvarGetLbAtIndex", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}, _SCIP_Bool), 
	pointer(var), pointer(bdchgidx), after
)
_SCIPvarGetUbAtIndex(var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t, after::_SCIP_Bool) = @scip_ccall("SCIPvarGetUbAtIndex", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}, _SCIP_Bool), 
	pointer(var), pointer(bdchgidx), after
)
_SCIPvarGetBdAtIndex(var::SCIP_VAR_t, boundtype::_SCIP_BOUNDTYPE, bdchgidx::SCIP_BDCHGIDX_t, after::_SCIP_Bool) = @scip_ccall("SCIPvarGetBdAtIndex", 
	_SCIP_Real, 
	(Ptr{_SCIP_VAR}, _SCIP_BOUNDTYPE, Ptr{_SCIP_BDCHGIDX}, _SCIP_Bool), 
	pointer(var), boundtype, pointer(bdchgidx), after
)
_SCIPvarWasFixedAtIndex(var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t, after::_SCIP_Bool) = @scip_ccall("SCIPvarWasFixedAtIndex", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}, _SCIP_Bool), 
	pointer(var), pointer(bdchgidx), after
)
_SCIPvarGetLastBdchgIndex(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetLastBdchgIndex", 
	Ptr{_SCIP_BDCHGIDX}, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarGetLastBdchgDepth(var::SCIP_VAR_t) = @scip_ccall("SCIPvarGetLastBdchgDepth", 
	Int, 
	(Ptr{_SCIP_VAR},), 
	pointer(var)
)
_SCIPvarWasFixedEarlier(var1::SCIP_VAR_t, var2::SCIP_VAR_t) = @scip_ccall("SCIPvarWasFixedEarlier", 
	_SCIP_Bool, 
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}), 
	pointer(var1), pointer(var2)
)
_SCIPbdchgidxIsEarlier(bdchgidx1::SCIP_BDCHGIDX_t, bdchgidx2::SCIP_BDCHGIDX_t) = @scip_ccall("SCIPbdchgidxIsEarlier", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BDCHGIDX}, Ptr{_SCIP_BDCHGIDX}), 
	pointer(bdchgidx1), pointer(bdchgidx2)
)
_SCIPbdchgidxIsEarlierNonNull(bdchgidx1::SCIP_BDCHGIDX_t, bdchgidx2::SCIP_BDCHGIDX_t) = @scip_ccall("SCIPbdchgidxIsEarlierNonNull", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BDCHGIDX}, Ptr{_SCIP_BDCHGIDX}), 
	pointer(bdchgidx1), pointer(bdchgidx2)
)
_SCIPbdchginfoGetOldbound(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetOldbound", 
	_SCIP_Real, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetNewbound(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetNewbound", 
	_SCIP_Real, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetVar(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetChgtype(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetChgtype", 
	_SCIP_BOUNDCHGTYPE, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetBoundtype(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetBoundtype", 
	_SCIP_BOUNDTYPE, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetDepth(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetDepth", 
	Int, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetPos(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetPos", 
	Int, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetIdx(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetIdx", 
	Ptr{_SCIP_BDCHGIDX}, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetInferVar(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetInferVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetInferCons(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetInferCons", 
	Ptr{_SCIP_CONS}, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetInferProp(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetInferProp", 
	Ptr{_SCIP_PROP}, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetInferInfo(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetInferInfo", 
	Int, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoGetInferBoundtype(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoGetInferBoundtype", 
	_SCIP_BOUNDTYPE, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoIsRedundant(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoIsRedundant", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoHasInferenceReason(bdchginfo::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoHasInferenceReason", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BDCHGINFO},), 
	pointer(bdchginfo)
)
_SCIPbdchginfoIsTighter(bdchginfo1::SCIP_BDCHGINFO_t, bdchginfo2::SCIP_BDCHGINFO_t) = @scip_ccall("SCIPbdchginfoIsTighter", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BDCHGINFO}, Ptr{_SCIP_BDCHGINFO}), 
	pointer(bdchginfo1), pointer(bdchginfo2)
)
_SCIPboundchgGetNewbound(boundchg::SCIP_BOUNDCHG_t) = @scip_ccall("SCIPboundchgGetNewbound", 
	_SCIP_Real, 
	(Ptr{_SCIP_BOUNDCHG},), 
	pointer(boundchg)
)
_SCIPboundchgGetVar(boundchg::SCIP_BOUNDCHG_t) = @scip_ccall("SCIPboundchgGetVar", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP_BOUNDCHG},), 
	pointer(boundchg)
)
_SCIPboundchgGetBoundchgtype(boundchg::SCIP_BOUNDCHG_t) = @scip_ccall("SCIPboundchgGetBoundchgtype", 
	_SCIP_BOUNDCHGTYPE, 
	(Ptr{_SCIP_BOUNDCHG},), 
	pointer(boundchg)
)
_SCIPboundchgGetBoundtype(boundchg::SCIP_BOUNDCHG_t) = @scip_ccall("SCIPboundchgGetBoundtype", 
	_SCIP_BOUNDTYPE, 
	(Ptr{_SCIP_BOUNDCHG},), 
	pointer(boundchg)
)
_SCIPboundchgIsRedundant(boundchg::SCIP_BOUNDCHG_t) = @scip_ccall("SCIPboundchgIsRedundant", 
	_SCIP_Bool, 
	(Ptr{_SCIP_BOUNDCHG},), 
	pointer(boundchg)
)
_SCIPdomchgGetNBoundchgs(domchg::SCIP_DOMCHG_t) = @scip_ccall("SCIPdomchgGetNBoundchgs", 
	Int, 
	(Ptr{_SCIP_DOMCHG},), 
	pointer(domchg)
)
_SCIPdomchgGetBoundchg(domchg::SCIP_DOMCHG_t, pos::Int) = @scip_ccall("SCIPdomchgGetBoundchg", 
	Ptr{_SCIP_BOUNDCHG}, 
	(Ptr{_SCIP_DOMCHG}, Int), 
	pointer(domchg), pos
)
_SCIPholelistGetLeft(holelist::SCIP_HOLELIST_t) = @scip_ccall("SCIPholelistGetLeft", 
	_SCIP_Real, 
	(Ptr{_SCIP_HOLELIST},), 
	pointer(holelist)
)
_SCIPholelistGetRight(holelist::SCIP_HOLELIST_t) = @scip_ccall("SCIPholelistGetRight", 
	_SCIP_Real, 
	(Ptr{_SCIP_HOLELIST},), 
	pointer(holelist)
)
_SCIPholelistGetNext(holelist::SCIP_HOLELIST_t) = @scip_ccall("SCIPholelistGetNext", 
	Ptr{_SCIP_HOLELIST}, 
	(Ptr{_SCIP_HOLELIST},), 
	pointer(holelist)
)
_SCIPgetLinearVarBivariate(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLinearVarBivariate", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLinearCoefBivariate(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLinearCoefBivariate", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetExprtreeBivariate(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetExprtreeBivariate", 
	Ptr{_SCIP_EXPRTREE}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsBivariate(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsBivariate", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsBivariate(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsBivariate", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPrelaxGetData(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxGetData", 
	Ptr{_SCIP_RELAXDATA}, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxSetData(relax::SCIP_RELAX_t, relaxdata::SCIP_RELAXDATA_t) = @scip_ccall("SCIPrelaxSetData", 
	Void, 
	(Ptr{_SCIP_RELAX}, Ptr{_SCIP_RELAXDATA}), 
	pointer(relax), pointer(relaxdata)
)
_SCIPrelaxGetName(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxGetName", 
	String, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxGetDesc(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxGetDesc", 
	String, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxGetPriority(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxGetPriority", 
	Int, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxGetFreq(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxGetFreq", 
	Int, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxGetSetupTime(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxGetTime(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxGetNCalls(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxGetNCalls", 
	Int64, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxIsInitialized(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPrelaxMarkUnsolved(relax::SCIP_RELAX_t) = @scip_ccall("SCIPrelaxMarkUnsolved", 
	Void, 
	(Ptr{_SCIP_RELAX},), 
	pointer(relax)
)
_SCIPgetNonlinearVarAbspower(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNonlinearVarAbspower", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLinearVarAbspower(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLinearVarAbspower", 
	Ptr{_SCIP_VAR}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetExponentAbspower(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetExponentAbspower", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetOffsetAbspower(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetOffsetAbspower", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetCoefLinearAbspower(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetCoefLinearAbspower", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetLhsAbspower(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetLhsAbspower", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetRhsAbspower(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetRhsAbspower", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetViolationAbspower(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t) = @scip_ccall("SCIPgetViolationAbspower", 
	_SCIP_Real, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(cons), pointer(sol)
)
_SCIPsolGetOrigin(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolGetOrigin", 
	_SCIP_SOLORIGIN, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPsolIsOriginal(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolIsOriginal", 
	_SCIP_Bool, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPsolGetOrigObj(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolGetOrigObj", 
	_SCIP_Real, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPsolGetTime(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPsolGetRunnum(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolGetRunnum", 
	Int, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPsolGetNodenum(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolGetNodenum", 
	Int64, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPsolGetDepth(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolGetDepth", 
	Int, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPsolGetHeur(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolGetHeur", 
	Ptr{_SCIP_HEUR}, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPsolSetHeur(sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall("SCIPsolSetHeur", 
	Void, 
	(Ptr{_SCIP_SOL}, Ptr{_SCIP_HEUR}), 
	pointer(sol), pointer(heur)
)
_SCIPsolGetIndex(sol::SCIP_SOL_t) = @scip_ccall("SCIPsolGetIndex", 
	Int, 
	(Ptr{_SCIP_SOL},), 
	pointer(sol)
)
_SCIPheurGetData(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetData", 
	Ptr{_SCIP_HEURDATA}, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurSetData(heur::SCIP_HEUR_t, heurdata::SCIP_HEURDATA_t) = @scip_ccall("SCIPheurSetData", 
	Void, 
	(Ptr{_SCIP_HEUR}, Ptr{_SCIP_HEURDATA}), 
	pointer(heur), pointer(heurdata)
)
_SCIPheurGetName(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetName", 
	String, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetDesc(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetDesc", 
	String, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetDispchar(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetDispchar", 
	Char, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetTimingmask(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetTimingmask", 
	_SCIP_HEURTIMING, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurSetTimingmask(heur::SCIP_HEUR_t, timingmask::_SCIP_HEURTIMING) = @scip_ccall("SCIPheurSetTimingmask", 
	Void, 
	(Ptr{_SCIP_HEUR}, _SCIP_HEURTIMING), 
	pointer(heur), timingmask
)
_SCIPheurUsesSubscip(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurUsesSubscip", 
	_SCIP_Bool, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetPriority(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetPriority", 
	Int, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetFreq(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetFreq", 
	Int, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurSetFreq(heur::SCIP_HEUR_t, freq::Int) = @scip_ccall("SCIPheurSetFreq", 
	Void, 
	(Ptr{_SCIP_HEUR}, Int), 
	pointer(heur), freq
)
_SCIPheurGetFreqofs(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetFreqofs", 
	Int, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetMaxdepth(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetMaxdepth", 
	Int, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetNCalls(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetNCalls", 
	Int64, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetNSolsFound(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetNSolsFound", 
	Int64, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetNBestSolsFound(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetNBestSolsFound", 
	Int64, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurIsInitialized(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurIsInitialized", 
	_SCIP_Bool, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetSetupTime(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetSetupTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPheurGetTime(heur::SCIP_HEUR_t) = @scip_ccall("SCIPheurGetTime", 
	_SCIP_Real, 
	(Ptr{_SCIP_HEUR},), 
	pointer(heur)
)
_SCIPgetHminCumulative(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetHminCumulative", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetHmaxCumulative(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetHmaxCumulative", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetVarsCumulative(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetVarsCumulative", 
	Ptr{Ptr{_SCIP_VAR}}, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetNVarsCumulative(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetNVarsCumulative", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetCapacityCumulative(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall("SCIPgetCapacityCumulative", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPcomputeHmin(scip::SCIP_t, profile::SCIP_PROFILE_t, capacity::Int) = @scip_ccall("SCIPcomputeHmin", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_PROFILE}, Int), 
	pointer(scip), pointer(profile), capacity
)
_SCIPcomputeHmax(scip::SCIP_t, profile::SCIP_PROFILE_t, capacity::Int) = @scip_ccall("SCIPcomputeHmax", 
	Int, 
	(Ptr{_SCIP}, Ptr{_SCIP_PROFILE}, Int), 
	pointer(scip), pointer(profile), capacity
)

# SCIP function wrappers: unchecked functions

_SCIPincludeConshdlrOrbitope(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrOrbitope",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsOrbitope(scip::SCIP_t, cons::SCIP_CONS_t, name::String, vars::SCIP_VAR_t, ispart::_SCIP_Bool, nspcons::Int, nblocks::Int, resolveprop::_SCIP_Bool, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsOrbitope",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{Ptr{Ptr{_SCIP_VAR}}}, _SCIP_Bool, Int, Int, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, array(vars), ispart, nspcons, nblocks, resolveprop, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicOrbitope(scip::SCIP_t, cons::SCIP_CONS_t, name::String, vars::SCIP_VAR_t, ispart::_SCIP_Bool, nspcons::Int, nblocks::Int, resolveprop::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsBasicOrbitope",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{Ptr{Ptr{_SCIP_VAR}}}, _SCIP_Bool, Int, Int, _SCIP_Bool), 
	pointer(scip), array(cons), name, array(vars), ispart, nspcons, nblocks, resolveprop
)
_SCIPincludeConshdlrVarbound(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrVarbound",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsVarbound(scip::SCIP_t, cons::SCIP_CONS_t, name::String, var::SCIP_VAR_t, vbdvar::SCIP_VAR_t, vbdcoef::_SCIP_Real, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsVarbound",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(var), pointer(vbdvar), vbdcoef, lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicVarbound(scip::SCIP_t, cons::SCIP_CONS_t, name::String, var::SCIP_VAR_t, vbdvar::SCIP_VAR_t, vbdcoef::_SCIP_Real, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicVarbound",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, pointer(var), pointer(vbdvar), vbdcoef, lhs, rhs
)
_SCIPmessagehdlrRelease(messagehdlr::SCIP_MESSAGEHDLR_t) = @scip_ccall_check("SCIPmessagehdlrRelease",
	(Ptr{Ptr{_SCIP_MESSAGEHDLR}},), 
	array(messagehdlr)
)
_SCIPmessagehdlrSetData(messagehdlr::SCIP_MESSAGEHDLR_t, messagehdlrdata::SCIP_MESSAGEHDLRDATA_t) = @scip_ccall_check("SCIPmessagehdlrSetData",
	(Ptr{_SCIP_MESSAGEHDLR}, Ptr{_SCIP_MESSAGEHDLRDATA}), 
	pointer(messagehdlr), pointer(messagehdlrdata)
)
_SCIPincludeConshdlrIntegral(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrIntegral",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPincludeConshdlrSOS1(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrSOS1",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsSOS1(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, weights::SCIP_Real_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsSOS1",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(weights), initial, separate, enforce, check, propagate, localVar, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicSOS1(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, weights::SCIP_Real_t) = @scip_ccall_check("SCIPcreateConsBasicSOS1",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(weights)
)
_SCIPaddVarSOS1(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, weight::_SCIP_Real) = @scip_ccall_check("SCIPaddVarSOS1",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), weight
)
_SCIPappendVarSOS1(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPappendVarSOS1",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(cons), pointer(var)
)
_SCIPexprtreeSetVars(tree::SCIP_EXPRTREE_t, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPexprtreeSetVars",
	(Ptr{_SCIP_EXPRTREE}, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(tree), nvars, array(vars)
)
_SCIPexprtreeAddVars(tree::SCIP_EXPRTREE_t, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPexprtreeAddVars",
	(Ptr{_SCIP_EXPRTREE}, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(tree), nvars, array(vars)
)
_SCIPincludeConshdlrLinking(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrLinking",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPincludeConshdlrIndicator(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrIndicator",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsIndicator(scip::SCIP_t, cons::SCIP_CONS_t, name::String, binvar::SCIP_VAR_t, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsIndicator",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(binvar), nvars, array(vars), pointer(vals), rhs, initial, separate, enforce, check, propagate, localVar, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicIndicator(scip::SCIP_t, cons::SCIP_CONS_t, name::String, binvar::SCIP_VAR_t, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicIndicator",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Real), 
	pointer(scip), array(cons), name, pointer(binvar), nvars, array(vars), pointer(vals), rhs
)
_SCIPcreateConsIndicatorLinCons(scip::SCIP_t, cons::SCIP_CONS_t, name::String, binvar::SCIP_VAR_t, lincons::SCIP_CONS_t, slackvar::SCIP_VAR_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsIndicatorLinCons",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(binvar), pointer(lincons), pointer(slackvar), initial, separate, enforce, check, propagate, localVar, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicIndicatorLinCons(scip::SCIP_t, cons::SCIP_CONS_t, name::String, binvar::SCIP_VAR_t, lincons::SCIP_CONS_t, slackvar::SCIP_VAR_t) = @scip_ccall_check("SCIPcreateConsBasicIndicatorLinCons",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}), 
	pointer(scip), array(cons), name, pointer(binvar), pointer(lincons), pointer(slackvar)
)
_SCIPaddVarIndicator(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, val::_SCIP_Real) = @scip_ccall_check("SCIPaddVarIndicator",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), val
)
_SCIPsetLinearConsIndicator(scip::SCIP_t, cons::SCIP_CONS_t, lincons::SCIP_CONS_t) = @scip_ccall_check("SCIPsetLinearConsIndicator",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons), pointer(lincons)
)
_SCIPsetBinaryVarIndicator(scip::SCIP_t, cons::SCIP_CONS_t, binvar::SCIP_VAR_t) = @scip_ccall_check("SCIPsetBinaryVarIndicator",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(cons), pointer(binvar)
)
_SCIPmakeIndicatorFeasible(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t, changed::SCIP_Bool_t) = @scip_ccall_check("SCIPmakeIndicatorFeasible",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(cons), pointer(sol), pointer(changed)
)
_SCIPmakeIndicatorsFeasible(scip::SCIP_t, conshdlr::SCIP_CONSHDLR_t, sol::SCIP_SOL_t, changed::SCIP_Bool_t) = @scip_ccall_check("SCIPmakeIndicatorsFeasible",
	(Ptr{_SCIP}, Ptr{_SCIP_CONSHDLR}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(conshdlr), pointer(sol), pointer(changed)
)
_SCIPaddLinearConsIndicator(scip::SCIP_t, conshdlr::SCIP_CONSHDLR_t, lincons::SCIP_CONS_t) = @scip_ccall_check("SCIPaddLinearConsIndicator",
	(Ptr{_SCIP}, Ptr{_SCIP_CONSHDLR}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(conshdlr), pointer(lincons)
)
_SCIPaddRowIndicator(scip::SCIP_t, conshdlr::SCIP_CONSHDLR_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPaddRowIndicator",
	(Ptr{_SCIP}, Ptr{_SCIP_CONSHDLR}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(conshdlr), pointer(row)
)
_SCIPincludeConshdlrXor(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrXor",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsXor(scip::SCIP_t, cons::SCIP_CONS_t, name::String, rhs::_SCIP_Bool, nvars::Int, vars::SCIP_VAR_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsXor",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, _SCIP_Bool, Int, Ptr{Ptr{_SCIP_VAR}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, rhs, nvars, array(vars), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicXor(scip::SCIP_t, cons::SCIP_CONS_t, name::String, rhs::_SCIP_Bool, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPcreateConsBasicXor",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, _SCIP_Bool, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), array(cons), name, rhs, nvars, array(vars)
)
_SCIPincludeConshdlrKnapsack(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrKnapsack",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsKnapsack(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, weights::Int64, capacity::Int64, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsKnapsack",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{Int64}, Int64, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(weights), capacity, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicKnapsack(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, weights::Int64, capacity::Int64) = @scip_ccall_check("SCIPcreateConsBasicKnapsack",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{Int64}, Int64), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(weights), capacity
)
_SCIPaddCoefKnapsack(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, weight::Int64) = @scip_ccall_check("SCIPaddCoefKnapsack",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, Int64), 
	pointer(scip), pointer(cons), pointer(var), weight
)
_SCIPchgCapacityKnapsack(scip::SCIP_t, cons::SCIP_CONS_t, capacity::Int64) = @scip_ccall_check("SCIPchgCapacityKnapsack",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Int64), 
	pointer(scip), pointer(cons), capacity
)
_SCIPincludeConshdlrSOS2(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrSOS2",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsSOS2(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, weights::SCIP_Real_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsSOS2",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(weights), initial, separate, enforce, check, propagate, localVar, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicSOS2(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, weights::SCIP_Real_t) = @scip_ccall_check("SCIPcreateConsBasicSOS2",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(weights)
)
_SCIPaddVarSOS2(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, weight::_SCIP_Real) = @scip_ccall_check("SCIPaddVarSOS2",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), weight
)
_SCIPappendVarSOS2(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPappendVarSOS2",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(cons), pointer(var)
)
_SCIPincludeConshdlrBounddisjunction(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrBounddisjunction",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsBounddisjunction(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, boundtypes::SCIP_BOUNDTYPE_t, bounds::SCIP_Real_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsBounddisjunction",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_BOUNDTYPE}, Ptr{_SCIP_Real}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(boundtypes), pointer(bounds), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicBounddisjunction(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, boundtypes::SCIP_BOUNDTYPE_t, bounds::SCIP_Real_t) = @scip_ccall_check("SCIPcreateConsBasicBounddisjunction",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_BOUNDTYPE}, Ptr{_SCIP_Real}), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(boundtypes), pointer(bounds)
)
_SCIPincludeConshdlrPseudoboolean(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrPseudoboolean",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsPseudobooleanWithConss(scip::SCIP_t, cons::SCIP_CONS_t, name::String, lincons::SCIP_CONS_t, linconstype::_SCIP_LINEARCONSTYPE, andconss::SCIP_CONS_t, andcoefs::SCIP_Real_t, nandconss::Int, indvar::SCIP_VAR_t, weight::_SCIP_Real, issoftcons::_SCIP_Bool, intvar::SCIP_VAR_t, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsPseudobooleanWithConss",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_CONS}, _SCIP_LINEARCONSTYPE, Ptr{Ptr{_SCIP_CONS}}, Ptr{_SCIP_Real}, Int, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Bool, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(lincons), linconstype, array(andconss), pointer(andcoefs), nandconss, pointer(indvar), weight, issoftcons, pointer(intvar), lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPincludeConshdlrAnd(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrAnd",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsAnd(scip::SCIP_t, cons::SCIP_CONS_t, name::String, resvar::SCIP_VAR_t, nvars::Int, vars::SCIP_VAR_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsAnd",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Int, Ptr{Ptr{_SCIP_VAR}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(resvar), nvars, array(vars), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicAnd(scip::SCIP_t, cons::SCIP_CONS_t, name::String, resvar::SCIP_VAR_t, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPcreateConsBasicAnd",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), array(cons), name, pointer(resvar), nvars, array(vars)
)
_SCIPsortAndCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPsortAndCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPchgAndConsCheckFlagWhenUpgr(scip::SCIP_t, cons::SCIP_CONS_t, flag::_SCIP_Bool) = @scip_ccall_check("SCIPchgAndConsCheckFlagWhenUpgr",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), flag
)
_SCIPchgAndConsRemovableFlagWhenUpgr(scip::SCIP_t, cons::SCIP_CONS_t, flag::_SCIP_Bool) = @scip_ccall_check("SCIPchgAndConsRemovableFlagWhenUpgr",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), flag
)
_SCIPincludeConshdlrSuperindicator(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrSuperindicator",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsSuperindicator(scip::SCIP_t, cons::SCIP_CONS_t, name::String, binvar::SCIP_VAR_t, slackcons::SCIP_CONS_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsSuperindicator",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Ptr{_SCIP_CONS}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(binvar), pointer(slackcons), initial, separate, enforce, check, propagate, localVar, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicSuperindicator(scip::SCIP_t, cons::SCIP_CONS_t, name::String, binvar::SCIP_VAR_t, slackcons::SCIP_CONS_t) = @scip_ccall_check("SCIPcreateConsBasicSuperindicator",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Ptr{_SCIP_CONS}), 
	pointer(scip), array(cons), name, pointer(binvar), pointer(slackcons)
)
_SCIPtransformMinUC(scip::SCIP_t, success::SCIP_Bool_t) = @scip_ccall_check("SCIPtransformMinUC",
	(Ptr{_SCIP}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(success)
)
_SCIPincludeConshdlrQuadratic(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrQuadratic",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, nquadterms::Int, quadvars1::SCIP_VAR_t, quadvars2::SCIP_VAR_t, quadcoeffs::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsQuadratic",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nlinvars, array(linvars), pointer(lincoefs), nquadterms, array(quadvars1), array(quadvars2), pointer(quadcoeffs), lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable
)
_SCIPcreateConsBasicQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, nquadterms::Int, quadvars1::SCIP_VAR_t, quadvars2::SCIP_VAR_t, quadcoefs::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicQuadratic",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, nlinvars, array(linvars), pointer(lincoefs), nquadterms, array(quadvars1), array(quadvars2), pointer(quadcoefs), lhs, rhs
)
_SCIPcreateConsQuadratic2(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, nquadvarterms::Int, quadvarterms::SCIP_QUADVARTERM_t, nbilinterms::Int, bilinterms::SCIP_BILINTERM_t, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsQuadratic2",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Int, Ptr{_SCIP_QUADVARTERM}, Int, Ptr{_SCIP_BILINTERM}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nlinvars, array(linvars), pointer(lincoefs), nquadvarterms, pointer(quadvarterms), nbilinterms, pointer(bilinterms), lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable
)
_SCIPcreateConsBasicQuadratic2(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, nquadvarterms::Int, quadvarterms::SCIP_QUADVARTERM_t, nbilinterms::Int, bilinterms::SCIP_BILINTERM_t, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicQuadratic2",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Int, Ptr{_SCIP_QUADVARTERM}, Int, Ptr{_SCIP_BILINTERM}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, nlinvars, array(linvars), pointer(lincoefs), nquadvarterms, pointer(quadvarterms), nbilinterms, pointer(bilinterms), lhs, rhs
)
_SCIPaddLinearVarQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, coef::_SCIP_Real) = @scip_ccall_check("SCIPaddLinearVarQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), coef
)
_SCIPaddQuadVarQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, lincoef::_SCIP_Real, sqrcoef::_SCIP_Real) = @scip_ccall_check("SCIPaddQuadVarQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), lincoef, sqrcoef
)
_SCIPaddQuadVarLinearCoefQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, coef::_SCIP_Real) = @scip_ccall_check("SCIPaddQuadVarLinearCoefQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), coef
)
_SCIPaddSquareCoefQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, coef::_SCIP_Real) = @scip_ccall_check("SCIPaddSquareCoefQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), coef
)
_SCIPaddBilinTermQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, var1::SCIP_VAR_t, var2::SCIP_VAR_t, coef::_SCIP_Real) = @scip_ccall_check("SCIPaddBilinTermQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var1), pointer(var2), coef
)
_SCIPgetNlRowQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPgetNlRowQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_NLROW}}), 
	pointer(scip), pointer(cons), array(nlrow)
)
_SCIPsortQuadVarTermsQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPsortQuadVarTermsQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPcheckCurvatureQuadratic(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPcheckCurvatureQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetViolationQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t, violation::SCIP_Real_t) = @scip_ccall_check("SCIPgetViolationQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(cons), pointer(sol), pointer(violation)
)
_SCIPaddToNlpiProblemQuadratic(scip::SCIP_t, cons::SCIP_CONS_t, nlpi::SCIP_NLPI_t, nlpiprob::SCIP_NLPIPROBLEM_t, scipvar2nlpivar::SCIP_HASHMAP_t, names::_SCIP_Bool) = @scip_ccall_check("SCIPaddToNlpiProblemQuadratic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_NLPI}, Ptr{_SCIP_NLPIPROBLEM}, Ptr{_SCIP_HASHMAP}, _SCIP_Bool), 
	pointer(scip), pointer(cons), pointer(nlpi), pointer(nlpiprob), pointer(scipvar2nlpivar), names
)
_SCIPincludeConshdlrDisjunction(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrDisjunction",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsDisjunction(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nconss::Int, conss::SCIP_CONS_t, relaxcons::SCIP_CONS_t, initial::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsDisjunction",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_CONS}}, Ptr{_SCIP_CONS}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nconss, array(conss), pointer(relaxcons), initial, enforce, check, localVar, modifiable, dynamic
)
_SCIPcreateConsBasicDisjunction(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nconss::Int, conss::SCIP_CONS_t, relaxcons::SCIP_CONS_t) = @scip_ccall_check("SCIPcreateConsBasicDisjunction",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_CONS}}, Ptr{_SCIP_CONS}), 
	pointer(scip), array(cons), name, nconss, array(conss), pointer(relaxcons)
)
_SCIPaddConsElemDisjunction(scip::SCIP_t, cons::SCIP_CONS_t, addcons::SCIP_CONS_t) = @scip_ccall_check("SCIPaddConsElemDisjunction",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons), pointer(addcons)
)
_SCIPincludeConshdlrLinear(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrLinear",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsLinear(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsLinear",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(vals), lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicLinear(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicLinear",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(vals), lhs, rhs
)
_SCIPcopyConsLinear(scip::SCIP_t, cons::SCIP_CONS_t, sourcescip::SCIP_t, name::String, nvars::Int, sourcevars::SCIP_VAR_t, sourcecoefs::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool, globalVar::_SCIP_Bool, valid::SCIP_Bool_t) = @scip_ccall_check("SCIPcopyConsLinear",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, Ptr{_SCIP}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(scip), array(cons), pointer(sourcescip), name, nvars, array(sourcevars), pointer(sourcecoefs), lhs, rhs, pointer(varmap), pointer(consmap), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode, globalVar, pointer(valid)
)
_SCIPaddCoefLinear(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, val::_SCIP_Real) = @scip_ccall_check("SCIPaddCoefLinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), val
)
_SCIPchgLhsLinear(scip::SCIP_t, cons::SCIP_CONS_t, lhs::_SCIP_Real) = @scip_ccall_check("SCIPchgLhsLinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Real), 
	pointer(scip), pointer(cons), lhs
)
_SCIPchgRhsLinear(scip::SCIP_t, cons::SCIP_CONS_t, rhs::_SCIP_Real) = @scip_ccall_check("SCIPchgRhsLinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Real), 
	pointer(scip), pointer(cons), rhs
)
_SCIPupgradeConsLinear(scip::SCIP_t, cons::SCIP_CONS_t, upgdcons::SCIP_CONS_t) = @scip_ccall_check("SCIPupgradeConsLinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_CONS}}), 
	pointer(scip), pointer(cons), array(upgdcons)
)
_SCIPincludeConshdlrConjunction(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrConjunction",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsConjunction(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nconss::Int, conss::SCIP_CONS_t, enforce::_SCIP_Bool, check::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsConjunction",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_CONS}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nconss, array(conss), enforce, check, localVar, modifiable, dynamic
)
_SCIPcreateConsBasicConjunction(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nconss::Int, conss::SCIP_CONS_t) = @scip_ccall_check("SCIPcreateConsBasicConjunction",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_CONS}}), 
	pointer(scip), array(cons), name, nconss, array(conss)
)
_SCIPaddConsElemConjunction(scip::SCIP_t, cons::SCIP_CONS_t, addcons::SCIP_CONS_t) = @scip_ccall_check("SCIPaddConsElemConjunction",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons), pointer(addcons)
)
_SCIPincludeConshdlrSOC(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrSOC",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsSOC(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, coefs::SCIP_Real_t, offsets::SCIP_Real_t, constant::_SCIP_Real, rhsvar::SCIP_VAR_t, rhscoeff::_SCIP_Real, rhsoffset::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsSOC",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, _SCIP_Real, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(coefs), pointer(offsets), constant, pointer(rhsvar), rhscoeff, rhsoffset, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable
)
_SCIPcreateConsBasicSOC(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, coefs::SCIP_Real_t, offsets::SCIP_Real_t, constant::_SCIP_Real, rhsvar::SCIP_VAR_t, rhscoeff::_SCIP_Real, rhsoffset::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicSOC",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, _SCIP_Real, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, nvars, array(vars), pointer(coefs), pointer(offsets), constant, pointer(rhsvar), rhscoeff, rhsoffset
)
_SCIPgetNlRowSOC(scip::SCIP_t, cons::SCIP_CONS_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPgetNlRowSOC",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_NLROW}}), 
	pointer(scip), pointer(cons), array(nlrow)
)
_SCIPaddToNlpiProblemSOC(scip::SCIP_t, cons::SCIP_CONS_t, nlpi::SCIP_NLPI_t, nlpiprob::SCIP_NLPIPROBLEM_t, scipvar2nlpivar::SCIP_HASHMAP_t, names::_SCIP_Bool) = @scip_ccall_check("SCIPaddToNlpiProblemSOC",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_NLPI}, Ptr{_SCIP_NLPIPROBLEM}, Ptr{_SCIP_HASHMAP}, _SCIP_Bool), 
	pointer(scip), pointer(cons), pointer(nlpi), pointer(nlpiprob), pointer(scipvar2nlpivar), names
)
_SCIPexprEval(expr::SCIP_EXPR_t, varvals::SCIP_Real_t, param::SCIP_Real_t, val::SCIP_Real_t) = @scip_ccall_check("SCIPexprEval",
	(Ptr{_SCIP_EXPR}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(expr), pointer(varvals), pointer(param), pointer(val)
)
_SCIPexprEvalInt(expr::SCIP_EXPR_t, infinity::_SCIP_Real, varvals::SCIP_INTERVAL_t, param::SCIP_Real_t, val::SCIP_INTERVAL_t) = @scip_ccall_check("SCIPexprEvalInt",
	(Ptr{_SCIP_EXPR}, _SCIP_Real, Ptr{_SCIP_INTERVAL}, Ptr{_SCIP_Real}, Ptr{_SCIP_INTERVAL}), 
	pointer(expr), infinity, pointer(varvals), pointer(param), pointer(val)
)
_SCIPexprCheckCurvature(expr::SCIP_EXPR_t, infinity::_SCIP_Real, varbounds::SCIP_INTERVAL_t, param::SCIP_Real_t, curv::SCIP_EXPRCURV_t, bounds::SCIP_INTERVAL_t) = @scip_ccall_check("SCIPexprCheckCurvature",
	(Ptr{_SCIP_EXPR}, _SCIP_Real, Ptr{_SCIP_INTERVAL}, Ptr{_SCIP_Real}, Ptr{_SCIP_EXPRCURV}, Ptr{_SCIP_INTERVAL}), 
	pointer(expr), infinity, pointer(varbounds), pointer(param), pointer(curv), pointer(bounds)
)
_SCIPexprtreeFreeInterpreterData(tree::SCIP_EXPRTREE_t) = @scip_ccall_check("SCIPexprtreeFreeInterpreterData",
	(Ptr{_SCIP_EXPRTREE},), 
	pointer(tree)
)
_SCIPexprtreeEval(tree::SCIP_EXPRTREE_t, varvals::SCIP_Real_t, val::SCIP_Real_t) = @scip_ccall_check("SCIPexprtreeEval",
	(Ptr{_SCIP_EXPRTREE}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(tree), pointer(varvals), pointer(val)
)
_SCIPexprtreeEvalInt(tree::SCIP_EXPRTREE_t, infinity::_SCIP_Real, varvals::SCIP_INTERVAL_t, val::SCIP_INTERVAL_t) = @scip_ccall_check("SCIPexprtreeEvalInt",
	(Ptr{_SCIP_EXPRTREE}, _SCIP_Real, Ptr{_SCIP_INTERVAL}, Ptr{_SCIP_INTERVAL}), 
	pointer(tree), infinity, pointer(varvals), pointer(val)
)
_SCIPexprtreeFree(tree::SCIP_EXPRTREE_t) = @scip_ccall_check("SCIPexprtreeFree",
	(Ptr{Ptr{_SCIP_EXPRTREE}},), 
	array(tree)
)
_SCIPexprtreeSetParams(tree::SCIP_EXPRTREE_t, nparams::Int, paramvals::SCIP_Real_t) = @scip_ccall_check("SCIPexprtreeSetParams",
	(Ptr{_SCIP_EXPRTREE}, Int, Ptr{_SCIP_Real}), 
	pointer(tree), nparams, pointer(paramvals)
)
_SCIPexprtreeAddExpr(tree::SCIP_EXPRTREE_t, expr::SCIP_EXPR_t, copyexpr::_SCIP_Bool) = @scip_ccall_check("SCIPexprtreeAddExpr",
	(Ptr{_SCIP_EXPRTREE}, Ptr{_SCIP_EXPR}, _SCIP_Bool), 
	pointer(tree), pointer(expr), copyexpr
)
_SCIPexprtreeCheckCurvature(tree::SCIP_EXPRTREE_t, infinity::_SCIP_Real, varbounds::SCIP_INTERVAL_t, curv::SCIP_EXPRCURV_t, bounds::SCIP_INTERVAL_t) = @scip_ccall_check("SCIPexprtreeCheckCurvature",
	(Ptr{_SCIP_EXPRTREE}, _SCIP_Real, Ptr{_SCIP_INTERVAL}, Ptr{_SCIP_EXPRCURV}, Ptr{_SCIP_INTERVAL}), 
	pointer(tree), infinity, pointer(varbounds), pointer(curv), pointer(bounds)
)
_SCIPexprtreeSubstituteVars(tree::SCIP_EXPRTREE_t, substexprs::SCIP_EXPR_t) = @scip_ccall_check("SCIPexprtreeSubstituteVars",
	(Ptr{_SCIP_EXPRTREE}, Ptr{Ptr{_SCIP_EXPR}}), 
	pointer(tree), array(substexprs)
)
_SCIPexprgraphMoveNodeParents(exprgraph::SCIP_EXPRGRAPH_t, srcnode::SCIP_EXPRGRAPHNODE_t, targetnode::SCIP_EXPRGRAPHNODE_t) = @scip_ccall_check("SCIPexprgraphMoveNodeParents",
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}, Ptr{_SCIP_EXPRGRAPHNODE}), 
	pointer(exprgraph), array(srcnode), pointer(targetnode)
)
_SCIPexprgraphReleaseNode(exprgraph::SCIP_EXPRGRAPH_t, node::SCIP_EXPRGRAPHNODE_t) = @scip_ccall_check("SCIPexprgraphReleaseNode",
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}), 
	pointer(exprgraph), array(node)
)
_SCIPexprgraphUpdateNodeBoundsCurvature(node::SCIP_EXPRGRAPHNODE_t, infinity::_SCIP_Real, minstrength::_SCIP_Real, clearreverseprop::_SCIP_Bool) = @scip_ccall_check("SCIPexprgraphUpdateNodeBoundsCurvature",
	(Ptr{_SCIP_EXPRGRAPHNODE}, _SCIP_Real, _SCIP_Real, _SCIP_Bool), 
	pointer(node), infinity, minstrength, clearreverseprop
)
_SCIPexprgraphFree(exprgraph::SCIP_EXPRGRAPH_t) = @scip_ccall_check("SCIPexprgraphFree",
	(Ptr{Ptr{_SCIP_EXPRGRAPH}},), 
	array(exprgraph)
)
_SCIPexprgraphAddNode(exprgraph::SCIP_EXPRGRAPH_t, node::SCIP_EXPRGRAPHNODE_t, mindepth::Int, nchildren::Int, children::SCIP_EXPRGRAPHNODE_t) = @scip_ccall_check("SCIPexprgraphAddNode",
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_EXPRGRAPHNODE}, Int, Int, Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}), 
	pointer(exprgraph), pointer(node), mindepth, nchildren, array(children)
)
_SCIPexprgraphAddConst(exprgraph::SCIP_EXPRGRAPH_t, constant::_SCIP_Real, constnode::SCIP_EXPRGRAPHNODE_t) = @scip_ccall_check("SCIPexprgraphAddConst",
	(Ptr{_SCIP_EXPRGRAPH}, _SCIP_Real, Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}), 
	pointer(exprgraph), constant, array(constnode)
)
_SCIPexprgraphAddExprtreeSum(exprgraph::SCIP_EXPRGRAPH_t, nexprtrees::Int, exprtrees::SCIP_EXPRTREE_t, coefs::SCIP_Real_t, rootnode::SCIP_EXPRGRAPHNODE_t, rootnodeisnew::SCIP_Bool_t) = @scip_ccall_check("SCIPexprgraphAddExprtreeSum",
	(Ptr{_SCIP_EXPRGRAPH}, Int, Ptr{Ptr{_SCIP_EXPRTREE}}, Ptr{_SCIP_Real}, Ptr{Ptr{_SCIP_EXPRGRAPHNODE}}, Ptr{_SCIP_Bool}), 
	pointer(exprgraph), nexprtrees, array(exprtrees), pointer(coefs), array(rootnode), pointer(rootnodeisnew)
)
_SCIPexprgraphEval(exprgraph::SCIP_EXPRGRAPH_t, varvals::SCIP_Real_t) = @scip_ccall_check("SCIPexprgraphEval",
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_Real}), 
	pointer(exprgraph), pointer(varvals)
)
_SCIPexprgraphPropagateVarBounds(exprgraph::SCIP_EXPRGRAPH_t, infinity::_SCIP_Real, clearreverseprop::_SCIP_Bool, domainerror::SCIP_Bool_t) = @scip_ccall_check("SCIPexprgraphPropagateVarBounds",
	(Ptr{_SCIP_EXPRGRAPH}, _SCIP_Real, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(exprgraph), infinity, clearreverseprop, pointer(domainerror)
)
_SCIPexprgraphCheckCurvature(exprgraph::SCIP_EXPRGRAPH_t, infinity::_SCIP_Real, clearreverseprop::_SCIP_Bool) = @scip_ccall_check("SCIPexprgraphCheckCurvature",
	(Ptr{_SCIP_EXPRGRAPH}, _SCIP_Real, _SCIP_Bool), 
	pointer(exprgraph), infinity, clearreverseprop
)
_SCIPexprgraphSimplify(exprgraph::SCIP_EXPRGRAPH_t, messagehdlr::SCIP_MESSAGEHDLR_t, eps::_SCIP_Real, maxexpansionexponent::Int, havechange::SCIP_Bool_t, domainerror::SCIP_Bool_t) = @scip_ccall_check("SCIPexprgraphSimplify",
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_MESSAGEHDLR}, _SCIP_Real, Int, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(exprgraph), pointer(messagehdlr), eps, maxexpansionexponent, pointer(havechange), pointer(domainerror)
)
_SCIPexprgraphGetTree(exprgraph::SCIP_EXPRGRAPH_t, rootnode::SCIP_EXPRGRAPHNODE_t, exprtree::SCIP_EXPRTREE_t) = @scip_ccall_check("SCIPexprgraphGetTree",
	(Ptr{_SCIP_EXPRGRAPH}, Ptr{_SCIP_EXPRGRAPHNODE}, Ptr{Ptr{_SCIP_EXPRTREE}}), 
	pointer(exprgraph), pointer(rootnode), array(exprtree)
)
_SCIPincludeConshdlrOr(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrOr",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsOr(scip::SCIP_t, cons::SCIP_CONS_t, name::String, resvar::SCIP_VAR_t, nvars::Int, vars::SCIP_VAR_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsOr",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Int, Ptr{Ptr{_SCIP_VAR}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(resvar), nvars, array(vars), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicOr(scip::SCIP_t, cons::SCIP_CONS_t, name::String, resvar::SCIP_VAR_t, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPcreateConsBasicOr",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), array(cons), name, pointer(resvar), nvars, array(vars)
)
_SCIPsparseSolCreate(sparsesol::SCIP_SPARSESOL_t, vars::SCIP_VAR_t, nvars::Int, cleared::_SCIP_Bool) = @scip_ccall_check("SCIPsparseSolCreate",
	(Ptr{Ptr{_SCIP_SPARSESOL}}, Ptr{Ptr{_SCIP_VAR}}, Int, _SCIP_Bool), 
	array(sparsesol), array(vars), nvars, cleared
)
_SCIPqueueCreate(queue::SCIP_QUEUE_t, initsize::Int, sizefac::_SCIP_Real) = @scip_ccall_check("SCIPqueueCreate",
	(Ptr{Ptr{_SCIP_QUEUE}}, Int, _SCIP_Real), 
	array(queue), initsize, sizefac
)
_SCIPhashmapRemoveAll(hashmap::SCIP_HASHMAP_t) = @scip_ccall_check("SCIPhashmapRemoveAll",
	(Ptr{_SCIP_HASHMAP},), 
	pointer(hashmap)
)
_SCIPactivityCreate(activity::SCIP_RESOURCEACTIVITY_t, var::SCIP_VAR_t, duration::Int, demand::Int) = @scip_ccall_check("SCIPactivityCreate",
	(Ptr{Ptr{_SCIP_RESOURCEACTIVITY}}, Ptr{_SCIP_VAR}, Int, Int), 
	array(activity), pointer(var), duration, demand
)
_SCIPprofileCreate(profile::SCIP_PROFILE_t, capacity::Int) = @scip_ccall_check("SCIPprofileCreate",
	(Ptr{Ptr{_SCIP_PROFILE}}, Int), 
	array(profile), capacity
)
_SCIPprofileDeleteCore(profile::SCIP_PROFILE_t, left::Int, right::Int, height::Int) = @scip_ccall_check("SCIPprofileDeleteCore",
	(Ptr{_SCIP_PROFILE}, Int, Int, Int), 
	pointer(profile), left, right, height
)
_SCIPdigraphCreate(digraph::SCIP_DIGRAPH_t, nnodes::Int) = @scip_ccall_check("SCIPdigraphCreate",
	(Ptr{Ptr{_SCIP_DIGRAPH}}, Int), 
	array(digraph), nnodes
)
_SCIPdigraphResize(digraph::SCIP_DIGRAPH_t, nnodes::Int) = @scip_ccall_check("SCIPdigraphResize",
	(Ptr{_SCIP_DIGRAPH}, Int), 
	pointer(digraph), nnodes
)
_SCIPdigraphCopy(targetdigraph::SCIP_DIGRAPH_t, sourcedigraph::SCIP_DIGRAPH_t) = @scip_ccall_check("SCIPdigraphCopy",
	(Ptr{Ptr{_SCIP_DIGRAPH}}, Ptr{_SCIP_DIGRAPH}), 
	array(targetdigraph), pointer(sourcedigraph)
)
_SCIPdigraphTopoSortComponents(digraph::SCIP_DIGRAPH_t) = @scip_ccall_check("SCIPdigraphTopoSortComponents",
	(Ptr{_SCIP_DIGRAPH},), 
	pointer(digraph)
)
_SCIPcalcIntegralScalar(vals::SCIP_Real_t, nvals::Int, mindelta::_SCIP_Real, maxdelta::_SCIP_Real, maxdnom::Int64, maxscale::_SCIP_Real, intscalar::SCIP_Real_t, success::SCIP_Bool_t) = @scip_ccall_check("SCIPcalcIntegralScalar",
	(Ptr{_SCIP_Real}, Int, _SCIP_Real, _SCIP_Real, Int64, _SCIP_Real, Ptr{_SCIP_Real}, Ptr{_SCIP_Bool}), 
	pointer(vals), nvals, mindelta, maxdelta, maxdnom, maxscale, pointer(intscalar), pointer(success)
)
_SCIPcreate(scip::SCIP_t) = @scip_ccall_check("SCIPcreate",
	(Ptr{Ptr{_SCIP}},), 
	array(scip)
)
_SCIPfree(scip::SCIP_t) = @scip_ccall_check("SCIPfree",
	(Ptr{Ptr{_SCIP}},), 
	array(scip)
)
_SCIPsetMessagehdlr(scip::SCIP_t, messagehdlr::SCIP_MESSAGEHDLR_t) = @scip_ccall_check("SCIPsetMessagehdlr",
	(Ptr{_SCIP}, Ptr{_SCIP_MESSAGEHDLR}), 
	pointer(scip), pointer(messagehdlr)
)
_SCIPcopyPlugins(sourcescip::SCIP_t, targetscip::SCIP_t, copyreaders::_SCIP_Bool, copypricers::_SCIP_Bool, copyconshdlrs::_SCIP_Bool, copyconflicthdlrs::_SCIP_Bool, copypresolvers::_SCIP_Bool, copyrelaxators::_SCIP_Bool, copyseparators::_SCIP_Bool, copypropagators::_SCIP_Bool, copyheuristics::_SCIP_Bool, copyeventhdlrs::_SCIP_Bool, copynodeselectors::_SCIP_Bool, copybranchrules::_SCIP_Bool, copydisplays::_SCIP_Bool, copydialogs::_SCIP_Bool, copynlpis::_SCIP_Bool, passmessagehdlr::_SCIP_Bool, valid::SCIP_Bool_t) = @scip_ccall_check("SCIPcopyPlugins",
	(Ptr{_SCIP}, Ptr{_SCIP}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(sourcescip), pointer(targetscip), copyreaders, copypricers, copyconshdlrs, copyconflicthdlrs, copypresolvers, copyrelaxators, copyseparators, copypropagators, copyheuristics, copyeventhdlrs, copynodeselectors, copybranchrules, copydisplays, copydialogs, copynlpis, passmessagehdlr, pointer(valid)
)
_SCIPcopyProb(sourcescip::SCIP_t, targetscip::SCIP_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, globalVar::_SCIP_Bool, name::String) = @scip_ccall_check("SCIPcopyProb",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, _SCIP_Bool, String), 
	pointer(sourcescip), pointer(targetscip), pointer(varmap), pointer(consmap), globalVar, name
)
_SCIPcopyOrigProb(sourcescip::SCIP_t, targetscip::SCIP_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, name::String) = @scip_ccall_check("SCIPcopyOrigProb",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, String), 
	pointer(sourcescip), pointer(targetscip), pointer(varmap), pointer(consmap), name
)
_SCIPgetVarCopy(sourcescip::SCIP_t, targetscip::SCIP_t, sourcevar::SCIP_VAR_t, targetvar::SCIP_VAR_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, globalVar::_SCIP_Bool, success::SCIP_Bool_t) = @scip_ccall_check("SCIPgetVarCopy",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(sourcescip), pointer(targetscip), pointer(sourcevar), array(targetvar), pointer(varmap), pointer(consmap), globalVar, pointer(success)
)
_SCIPcopyVars(sourcescip::SCIP_t, targetscip::SCIP_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, globalVar::_SCIP_Bool) = @scip_ccall_check("SCIPcopyVars",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, _SCIP_Bool), 
	pointer(sourcescip), pointer(targetscip), pointer(varmap), pointer(consmap), globalVar
)
_SCIPcopyOrigVars(sourcescip::SCIP_t, targetscip::SCIP_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t) = @scip_ccall_check("SCIPcopyOrigVars",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}), 
	pointer(sourcescip), pointer(targetscip), pointer(varmap), pointer(consmap)
)
_SCIPgetConsCopy(sourcescip::SCIP_t, targetscip::SCIP_t, sourcecons::SCIP_CONS_t, targetcons::SCIP_CONS_t, sourceconshdlr::SCIP_CONSHDLR_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, name::String, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool, globalVar::_SCIP_Bool, success::SCIP_Bool_t) = @scip_ccall_check("SCIPgetConsCopy",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_CONS}}, Ptr{_SCIP_CONSHDLR}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, String, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(sourcescip), pointer(targetscip), pointer(sourcecons), array(targetcons), pointer(sourceconshdlr), pointer(varmap), pointer(consmap), name, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode, globalVar, pointer(success)
)
_SCIPcopyConss(sourcescip::SCIP_t, targetscip::SCIP_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, globalVar::_SCIP_Bool, enablepricing::_SCIP_Bool, valid::SCIP_Bool_t) = @scip_ccall_check("SCIPcopyConss",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(sourcescip), pointer(targetscip), pointer(varmap), pointer(consmap), globalVar, enablepricing, pointer(valid)
)
_SCIPcopyOrigConss(sourcescip::SCIP_t, targetscip::SCIP_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, enablepricing::_SCIP_Bool, valid::SCIP_Bool_t) = @scip_ccall_check("SCIPcopyOrigConss",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(sourcescip), pointer(targetscip), pointer(varmap), pointer(consmap), enablepricing, pointer(valid)
)
_SCIPcopyParamSettings(sourcescip::SCIP_t, targetscip::SCIP_t) = @scip_ccall_check("SCIPcopyParamSettings",
	(Ptr{_SCIP}, Ptr{_SCIP}), 
	pointer(sourcescip), pointer(targetscip)
)
_SCIPcopy(sourcescip::SCIP_t, targetscip::SCIP_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, suffix::String, globalVar::_SCIP_Bool, enablepricing::_SCIP_Bool, passmessagehdlr::_SCIP_Bool, valid::SCIP_Bool_t) = @scip_ccall_check("SCIPcopy",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, String, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(sourcescip), pointer(targetscip), pointer(varmap), pointer(consmap), suffix, globalVar, enablepricing, passmessagehdlr, pointer(valid)
)
_SCIPcopyOrig(sourcescip::SCIP_t, targetscip::SCIP_t, varmap::SCIP_HASHMAP_t, consmap::SCIP_HASHMAP_t, suffix::String, enablepricing::_SCIP_Bool, passmessagehdlr::_SCIP_Bool, valid::SCIP_Bool_t) = @scip_ccall_check("SCIPcopyOrig",
	(Ptr{_SCIP}, Ptr{_SCIP}, Ptr{_SCIP_HASHMAP}, Ptr{_SCIP_HASHMAP}, String, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(sourcescip), pointer(targetscip), pointer(varmap), pointer(consmap), suffix, enablepricing, passmessagehdlr, pointer(valid)
)
_SCIPgetBoolParam(scip::SCIP_t, name::String, value::SCIP_Bool_t) = @scip_ccall_check("SCIPgetBoolParam",
	(Ptr{_SCIP}, String, Ptr{_SCIP_Bool}), 
	pointer(scip), name, pointer(value)
)
_SCIPgetLongintParam(scip::SCIP_t, name::String, value::Int64) = @scip_ccall_check("SCIPgetLongintParam",
	(Ptr{_SCIP}, String, Ptr{Int64}), 
	pointer(scip), name, pointer(value)
)
_SCIPgetRealParam(scip::SCIP_t, name::String, value::SCIP_Real_t) = @scip_ccall_check("SCIPgetRealParam",
	(Ptr{_SCIP}, String, Ptr{_SCIP_Real}), 
	pointer(scip), name, pointer(value)
)
_SCIPfixParam(scip::SCIP_t, name::String) = @scip_ccall_check("SCIPfixParam",
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPunfixParam(scip::SCIP_t, name::String) = @scip_ccall_check("SCIPunfixParam",
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPchgBoolParam(scip::SCIP_t, param::SCIP_PARAM_t, value::_SCIP_Bool) = @scip_ccall_check("SCIPchgBoolParam",
	(Ptr{_SCIP}, Ptr{_SCIP_PARAM}, _SCIP_Bool), 
	pointer(scip), pointer(param), value
)
_SCIPsetBoolParam(scip::SCIP_t, name::String, value::_SCIP_Bool) = @scip_ccall_check("SCIPsetBoolParam",
	(Ptr{_SCIP}, String, _SCIP_Bool), 
	pointer(scip), name, value
)
_SCIPchgIntParam(scip::SCIP_t, param::SCIP_PARAM_t, value::Int) = @scip_ccall_check("SCIPchgIntParam",
	(Ptr{_SCIP}, Ptr{_SCIP_PARAM}, Int), 
	pointer(scip), pointer(param), value
)
_SCIPsetIntParam(scip::SCIP_t, name::String, value::Int) = @scip_ccall_check("SCIPsetIntParam",
	(Ptr{_SCIP}, String, Int), 
	pointer(scip), name, value
)
_SCIPchgLongintParam(scip::SCIP_t, param::SCIP_PARAM_t, value::Int64) = @scip_ccall_check("SCIPchgLongintParam",
	(Ptr{_SCIP}, Ptr{_SCIP_PARAM}, Int64), 
	pointer(scip), pointer(param), value
)
_SCIPsetLongintParam(scip::SCIP_t, name::String, value::Int64) = @scip_ccall_check("SCIPsetLongintParam",
	(Ptr{_SCIP}, String, Int64), 
	pointer(scip), name, value
)
_SCIPchgRealParam(scip::SCIP_t, param::SCIP_PARAM_t, value::_SCIP_Real) = @scip_ccall_check("SCIPchgRealParam",
	(Ptr{_SCIP}, Ptr{_SCIP_PARAM}, _SCIP_Real), 
	pointer(scip), pointer(param), value
)
_SCIPsetRealParam(scip::SCIP_t, name::String, value::_SCIP_Real) = @scip_ccall_check("SCIPsetRealParam",
	(Ptr{_SCIP}, String, _SCIP_Real), 
	pointer(scip), name, value
)
_SCIPchgCharParam(scip::SCIP_t, param::SCIP_PARAM_t, value::Char) = @scip_ccall_check("SCIPchgCharParam",
	(Ptr{_SCIP}, Ptr{_SCIP_PARAM}, Char), 
	pointer(scip), pointer(param), value
)
_SCIPsetCharParam(scip::SCIP_t, name::String, value::Char) = @scip_ccall_check("SCIPsetCharParam",
	(Ptr{_SCIP}, String, Char), 
	pointer(scip), name, value
)
_SCIPchgStringParam(scip::SCIP_t, param::SCIP_PARAM_t, value::String) = @scip_ccall_check("SCIPchgStringParam",
	(Ptr{_SCIP}, Ptr{_SCIP_PARAM}, String), 
	pointer(scip), pointer(param), value
)
_SCIPsetStringParam(scip::SCIP_t, name::String, value::String) = @scip_ccall_check("SCIPsetStringParam",
	(Ptr{_SCIP}, String, String), 
	pointer(scip), name, value
)
_SCIPreadParams(scip::SCIP_t, filename::String) = @scip_ccall_check("SCIPreadParams",
	(Ptr{_SCIP}, String), 
	pointer(scip), filename
)
_SCIPwriteParams(scip::SCIP_t, filename::String, comments::_SCIP_Bool, onlychanged::_SCIP_Bool) = @scip_ccall_check("SCIPwriteParams",
	(Ptr{_SCIP}, String, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), filename, comments, onlychanged
)
_SCIPresetParam(scip::SCIP_t, name::String) = @scip_ccall_check("SCIPresetParam",
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPresetParams(scip::SCIP_t) = @scip_ccall_check("SCIPresetParams",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsetEmphasis(scip::SCIP_t, paramemphasis::_SCIP_PARAMEMPHASIS, quiet::_SCIP_Bool) = @scip_ccall_check("SCIPsetEmphasis",
	(Ptr{_SCIP}, _SCIP_PARAMEMPHASIS, _SCIP_Bool), 
	pointer(scip), paramemphasis, quiet
)
_SCIPsetSubscipsOff(scip::SCIP_t, quiet::_SCIP_Bool) = @scip_ccall_check("SCIPsetSubscipsOff",
	(Ptr{_SCIP}, _SCIP_Bool), 
	pointer(scip), quiet
)
_SCIPsetHeuristics(scip::SCIP_t, paramsetting::_SCIP_PARAMSETTING, quiet::_SCIP_Bool) = @scip_ccall_check("SCIPsetHeuristics",
	(Ptr{_SCIP}, _SCIP_PARAMSETTING, _SCIP_Bool), 
	pointer(scip), paramsetting, quiet
)
_SCIPsetPresolving(scip::SCIP_t, paramsetting::_SCIP_PARAMSETTING, quiet::_SCIP_Bool) = @scip_ccall_check("SCIPsetPresolving",
	(Ptr{_SCIP}, _SCIP_PARAMSETTING, _SCIP_Bool), 
	pointer(scip), paramsetting, quiet
)
_SCIPsetSeparating(scip::SCIP_t, paramsetting::_SCIP_PARAMSETTING, quiet::_SCIP_Bool) = @scip_ccall_check("SCIPsetSeparating",
	(Ptr{_SCIP}, _SCIP_PARAMSETTING, _SCIP_Bool), 
	pointer(scip), paramsetting, quiet
)
_SCIPincludeReaderBasic(scip::SCIP_t, readerptr::SCIP_READER_t, name::String, desc::String, extension::String, readerdata::SCIP_READERDATA_t) = @scip_ccall_check("SCIPincludeReaderBasic",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_READER}}, String, String, String, Ptr{_SCIP_READERDATA}), 
	pointer(scip), array(readerptr), name, desc, extension, pointer(readerdata)
)
_SCIPsetPricerPriority(scip::SCIP_t, pricer::SCIP_PRICER_t, priority::Int) = @scip_ccall_check("SCIPsetPricerPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_PRICER}, Int), 
	pointer(scip), pointer(pricer), priority
)
_SCIPactivatePricer(scip::SCIP_t, pricer::SCIP_PRICER_t) = @scip_ccall_check("SCIPactivatePricer",
	(Ptr{_SCIP}, Ptr{_SCIP_PRICER}), 
	pointer(scip), pointer(pricer)
)
_SCIPdeactivatePricer(scip::SCIP_t, pricer::SCIP_PRICER_t) = @scip_ccall_check("SCIPdeactivatePricer",
	(Ptr{_SCIP}, Ptr{_SCIP_PRICER}), 
	pointer(scip), pointer(pricer)
)
_SCIPsetConflicthdlrPriority(scip::SCIP_t, conflicthdlr::SCIP_CONFLICTHDLR_t, priority::Int) = @scip_ccall_check("SCIPsetConflicthdlrPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_CONFLICTHDLR}, Int), 
	pointer(scip), pointer(conflicthdlr), priority
)
_SCIPsetPresolPriority(scip::SCIP_t, presol::SCIP_PRESOL_t, priority::Int) = @scip_ccall_check("SCIPsetPresolPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_PRESOL}, Int), 
	pointer(scip), pointer(presol), priority
)
_SCIPsetRelaxPriority(scip::SCIP_t, relax::SCIP_RELAX_t, priority::Int) = @scip_ccall_check("SCIPsetRelaxPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_RELAX}, Int), 
	pointer(scip), pointer(relax), priority
)
_SCIPsetSepaPriority(scip::SCIP_t, sepa::SCIP_SEPA_t, priority::Int) = @scip_ccall_check("SCIPsetSepaPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_SEPA}, Int), 
	pointer(scip), pointer(sepa), priority
)
_SCIPsetPropPriority(scip::SCIP_t, prop::SCIP_PROP_t, priority::Int) = @scip_ccall_check("SCIPsetPropPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_PROP}, Int), 
	pointer(scip), pointer(prop), priority
)
_SCIPsetPropPresolPriority(scip::SCIP_t, prop::SCIP_PROP_t, presolpriority::Int) = @scip_ccall_check("SCIPsetPropPresolPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_PROP}, Int), 
	pointer(scip), pointer(prop), presolpriority
)
_SCIPsetHeurPriority(scip::SCIP_t, heur::SCIP_HEUR_t, priority::Int) = @scip_ccall_check("SCIPsetHeurPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_HEUR}, Int), 
	pointer(scip), pointer(heur), priority
)
_SCIPsetNodeselStdPriority(scip::SCIP_t, nodesel::SCIP_NODESEL_t, priority::Int) = @scip_ccall_check("SCIPsetNodeselStdPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_NODESEL}, Int), 
	pointer(scip), pointer(nodesel), priority
)
_SCIPsetNodeselMemsavePriority(scip::SCIP_t, nodesel::SCIP_NODESEL_t, priority::Int) = @scip_ccall_check("SCIPsetNodeselMemsavePriority",
	(Ptr{_SCIP}, Ptr{_SCIP_NODESEL}, Int), 
	pointer(scip), pointer(nodesel), priority
)
_SCIPincludeBranchruleBasic(scip::SCIP_t, branchruleptr::SCIP_BRANCHRULE_t, name::String, desc::String, priority::Int, maxdepth::Int, maxbounddist::_SCIP_Real, branchruledata::SCIP_BRANCHRULEDATA_t) = @scip_ccall_check("SCIPincludeBranchruleBasic",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_BRANCHRULE}}, String, String, Int, Int, _SCIP_Real, Ptr{_SCIP_BRANCHRULEDATA}), 
	pointer(scip), array(branchruleptr), name, desc, priority, maxdepth, maxbounddist, pointer(branchruledata)
)
_SCIPsetBranchrulePriority(scip::SCIP_t, branchrule::SCIP_BRANCHRULE_t, priority::Int) = @scip_ccall_check("SCIPsetBranchrulePriority",
	(Ptr{_SCIP}, Ptr{_SCIP_BRANCHRULE}, Int), 
	pointer(scip), pointer(branchrule), priority
)
_SCIPsetBranchruleMaxdepth(scip::SCIP_t, branchrule::SCIP_BRANCHRULE_t, maxdepth::Int) = @scip_ccall_check("SCIPsetBranchruleMaxdepth",
	(Ptr{_SCIP}, Ptr{_SCIP_BRANCHRULE}, Int), 
	pointer(scip), pointer(branchrule), maxdepth
)
_SCIPsetBranchruleMaxbounddist(scip::SCIP_t, branchrule::SCIP_BRANCHRULE_t, maxbounddist::_SCIP_Real) = @scip_ccall_check("SCIPsetBranchruleMaxbounddist",
	(Ptr{_SCIP}, Ptr{_SCIP_BRANCHRULE}, _SCIP_Real), 
	pointer(scip), pointer(branchrule), maxbounddist
)
_SCIPautoselectDisps(scip::SCIP_t) = @scip_ccall_check("SCIPautoselectDisps",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPincludeNlpi(scip::SCIP_t, nlpi::SCIP_NLPI_t) = @scip_ccall_check("SCIPincludeNlpi",
	(Ptr{_SCIP}, Ptr{_SCIP_NLPI}), 
	pointer(scip), pointer(nlpi)
)
_SCIPsetNlpiPriority(scip::SCIP_t, nlpi::SCIP_NLPI_t, priority::Int) = @scip_ccall_check("SCIPsetNlpiPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_NLPI}, Int), 
	pointer(scip), pointer(nlpi), priority
)
_SCIPincludeExternalCodeInformation(scip::SCIP_t, name::String, description::String) = @scip_ccall_check("SCIPincludeExternalCodeInformation",
	(Ptr{_SCIP}, String, String), 
	pointer(scip), name, description
)
_SCIPcaptureDialog(scip::SCIP_t, dialog::SCIP_DIALOG_t) = @scip_ccall_check("SCIPcaptureDialog",
	(Ptr{_SCIP}, Ptr{_SCIP_DIALOG}), 
	pointer(scip), pointer(dialog)
)
_SCIPreleaseDialog(scip::SCIP_t, dialog::SCIP_DIALOG_t) = @scip_ccall_check("SCIPreleaseDialog",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_DIALOG}}), 
	pointer(scip), array(dialog)
)
_SCIPsetRootDialog(scip::SCIP_t, dialog::SCIP_DIALOG_t) = @scip_ccall_check("SCIPsetRootDialog",
	(Ptr{_SCIP}, Ptr{_SCIP_DIALOG}), 
	pointer(scip), pointer(dialog)
)
_SCIPaddDialogEntry(scip::SCIP_t, dialog::SCIP_DIALOG_t, subdialog::SCIP_DIALOG_t) = @scip_ccall_check("SCIPaddDialogEntry",
	(Ptr{_SCIP}, Ptr{_SCIP_DIALOG}, Ptr{_SCIP_DIALOG}), 
	pointer(scip), pointer(dialog), pointer(subdialog)
)
_SCIPaddDialogInputLine(scip::SCIP_t, inputline::String) = @scip_ccall_check("SCIPaddDialogInputLine",
	(Ptr{_SCIP}, String), 
	pointer(scip), inputline
)
_SCIPaddDialogHistoryLine(scip::SCIP_t, inputline::String) = @scip_ccall_check("SCIPaddDialogHistoryLine",
	(Ptr{_SCIP}, String), 
	pointer(scip), inputline
)
_SCIPstartInteraction(scip::SCIP_t) = @scip_ccall_check("SCIPstartInteraction",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateProbBasic(scip::SCIP_t, name::String) = @scip_ccall_check("SCIPcreateProbBasic",
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPreadProb(scip::SCIP_t, filename::String, extension::String) = @scip_ccall_check("SCIPreadProb",
	(Ptr{_SCIP}, String, String), 
	pointer(scip), filename, extension
)
_SCIPwriteOrigProblem(scip::SCIP_t, filename::String, extension::String, genericnames::_SCIP_Bool) = @scip_ccall_check("SCIPwriteOrigProblem",
	(Ptr{_SCIP}, String, String, _SCIP_Bool), 
	pointer(scip), filename, extension, genericnames
)
_SCIPwriteTransProblem(scip::SCIP_t, filename::String, extension::String, genericnames::_SCIP_Bool) = @scip_ccall_check("SCIPwriteTransProblem",
	(Ptr{_SCIP}, String, String, _SCIP_Bool), 
	pointer(scip), filename, extension, genericnames
)
_SCIPfreeProb(scip::SCIP_t) = @scip_ccall_check("SCIPfreeProb",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPpermuteProb(scip::SCIP_t, randseed::Uint, permuteconss::_SCIP_Bool, permutebinvars::_SCIP_Bool, permuteintvars::_SCIP_Bool, permuteimplvars::_SCIP_Bool, permutecontvars::_SCIP_Bool) = @scip_ccall_check("SCIPpermuteProb",
	(Ptr{_SCIP}, Uint, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), randseed, permuteconss, permutebinvars, permuteintvars, permuteimplvars, permutecontvars
)
_SCIPsetProbData(scip::SCIP_t, probdata::SCIP_PROBDATA_t) = @scip_ccall_check("SCIPsetProbData",
	(Ptr{_SCIP}, Ptr{_SCIP_PROBDATA}), 
	pointer(scip), pointer(probdata)
)
_SCIPsetProbName(scip::SCIP_t, name::String) = @scip_ccall_check("SCIPsetProbName",
	(Ptr{_SCIP}, String), 
	pointer(scip), name
)
_SCIPsetObjsense(scip::SCIP_t, objsense::_SCIP_OBJSENSE) = @scip_ccall_check("SCIPsetObjsense",
	(Ptr{_SCIP}, _SCIP_OBJSENSE), 
	pointer(scip), objsense
)
_SCIPaddObjoffset(scip::SCIP_t, addval::_SCIP_Real) = @scip_ccall_check("SCIPaddObjoffset",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), addval
)
_SCIPaddOrigObjoffset(scip::SCIP_t, addval::_SCIP_Real) = @scip_ccall_check("SCIPaddOrigObjoffset",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), addval
)
_SCIPsetObjlimit(scip::SCIP_t, objlimit::_SCIP_Real) = @scip_ccall_check("SCIPsetObjlimit",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), objlimit
)
_SCIPsetObjIntegral(scip::SCIP_t) = @scip_ccall_check("SCIPsetObjIntegral",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPaddVar(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPaddVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPaddPricedVar(scip::SCIP_t, var::SCIP_VAR_t, score::_SCIP_Real) = @scip_ccall_check("SCIPaddPricedVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), score
)
_SCIPdelVar(scip::SCIP_t, var::SCIP_VAR_t, deleted::SCIP_Bool_t) = @scip_ccall_check("SCIPdelVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), pointer(deleted)
)
_SCIPaddCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPaddCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPdelCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPdelCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPaddConsNode(scip::SCIP_t, node::SCIP_NODE_t, cons::SCIP_CONS_t, validnode::SCIP_NODE_t) = @scip_ccall_check("SCIPaddConsNode",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}, Ptr{_SCIP_CONS}, Ptr{_SCIP_NODE}), 
	pointer(scip), pointer(node), pointer(cons), pointer(validnode)
)
_SCIPaddConsLocal(scip::SCIP_t, cons::SCIP_CONS_t, validnode::SCIP_NODE_t) = @scip_ccall_check("SCIPaddConsLocal",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_NODE}), 
	pointer(scip), pointer(cons), pointer(validnode)
)
_SCIPdelConsNode(scip::SCIP_t, node::SCIP_NODE_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPdelConsNode",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(node), pointer(cons)
)
_SCIPdelConsLocal(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPdelConsLocal",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPupdateLocalDualbound(scip::SCIP_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPupdateLocalDualbound",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), newbound
)
_SCIPupdateLocalLowerbound(scip::SCIP_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPupdateLocalLowerbound",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), newbound
)
_SCIPupdateNodeDualbound(scip::SCIP_t, node::SCIP_NODE_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPupdateNodeDualbound",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}, _SCIP_Real), 
	pointer(scip), pointer(node), newbound
)
_SCIPupdateNodeLowerbound(scip::SCIP_t, node::SCIP_NODE_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPupdateNodeLowerbound",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}, _SCIP_Real), 
	pointer(scip), pointer(node), newbound
)
_SCIPchgChildPrio(scip::SCIP_t, child::SCIP_NODE_t, priority::_SCIP_Real) = @scip_ccall_check("SCIPchgChildPrio",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}, _SCIP_Real), 
	pointer(scip), pointer(child), priority
)
_SCIPtransformProb(scip::SCIP_t) = @scip_ccall_check("SCIPtransformProb",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPpresolve(scip::SCIP_t) = @scip_ccall_check("SCIPpresolve",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsolve(scip::SCIP_t) = @scip_ccall_check("SCIPsolve",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPfreeSolve(scip::SCIP_t, restart::_SCIP_Bool) = @scip_ccall_check("SCIPfreeSolve",
	(Ptr{_SCIP}, _SCIP_Bool), 
	pointer(scip), restart
)
_SCIPfreeTransform(scip::SCIP_t) = @scip_ccall_check("SCIPfreeTransform",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPinterruptSolve(scip::SCIP_t) = @scip_ccall_check("SCIPinterruptSolve",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPrestartSolve(scip::SCIP_t) = @scip_ccall_check("SCIPrestartSolve",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateVarBasic(scip::SCIP_t, var::SCIP_VAR_t, name::String, lb::_SCIP_Real, ub::_SCIP_Real, obj::_SCIP_Real, vartype::_SCIP_VARTYPE) = @scip_ccall_check("SCIPcreateVarBasic",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_VAR}}, String, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_VARTYPE), 
	pointer(scip), array(var), name, lb, ub, obj, vartype
)
_SCIPcaptureVar(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPcaptureVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPreleaseVar(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPreleaseVar",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), array(var)
)
_SCIPchgVarName(scip::SCIP_t, var::SCIP_VAR_t, name::String) = @scip_ccall_check("SCIPchgVarName",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, String), 
	pointer(scip), pointer(var), name
)
_SCIPtransformVar(scip::SCIP_t, var::SCIP_VAR_t, transvar::SCIP_VAR_t) = @scip_ccall_check("SCIPtransformVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), pointer(var), array(transvar)
)
_SCIPtransformVars(scip::SCIP_t, nvars::Int, vars::SCIP_VAR_t, transvars::SCIP_VAR_t) = @scip_ccall_check("SCIPtransformVars",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), nvars, array(vars), array(transvars)
)
_SCIPgetTransformedVar(scip::SCIP_t, var::SCIP_VAR_t, transvar::SCIP_VAR_t) = @scip_ccall_check("SCIPgetTransformedVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), pointer(var), array(transvar)
)
_SCIPgetTransformedVars(scip::SCIP_t, nvars::Int, vars::SCIP_VAR_t, transvars::SCIP_VAR_t) = @scip_ccall_check("SCIPgetTransformedVars",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), nvars, array(vars), array(transvars)
)
_SCIPgetNegatedVar(scip::SCIP_t, var::SCIP_VAR_t, negvar::SCIP_VAR_t) = @scip_ccall_check("SCIPgetNegatedVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), pointer(var), array(negvar)
)
_SCIPgetNegatedVars(scip::SCIP_t, nvars::Int, vars::SCIP_VAR_t, negvars::SCIP_VAR_t) = @scip_ccall_check("SCIPgetNegatedVars",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), nvars, array(vars), array(negvars)
)
_SCIPgetBinvarRepresentative(scip::SCIP_t, var::SCIP_VAR_t, repvar::SCIP_VAR_t, negated::SCIP_Bool_t) = @scip_ccall_check("SCIPgetBinvarRepresentative",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), array(repvar), pointer(negated)
)
_SCIPgetBinvarRepresentatives(scip::SCIP_t, nvars::Int, vars::SCIP_VAR_t, repvars::SCIP_VAR_t, negated::SCIP_Bool_t) = @scip_ccall_check("SCIPgetBinvarRepresentatives",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Bool}), 
	pointer(scip), nvars, array(vars), array(repvars), pointer(negated)
)
_SCIPflattenVarAggregationGraph(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPflattenVarAggregationGraph",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPgetProbvarSum(scip::SCIP_t, var::SCIP_VAR_t, scalar::SCIP_Real_t, constant::SCIP_Real_t) = @scip_ccall_check("SCIPgetProbvarSum",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(scip), array(var), pointer(scalar), pointer(constant)
)
_SCIPgetVarSols(scip::SCIP_t, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t) = @scip_ccall_check("SCIPgetVarSols",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}), 
	pointer(scip), nvars, array(vars), pointer(vals)
)
_SCIPclearRelaxSolVals(scip::SCIP_t) = @scip_ccall_check("SCIPclearRelaxSolVals",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsetRelaxSolVal(scip::SCIP_t, var::SCIP_VAR_t, val::_SCIP_Real) = @scip_ccall_check("SCIPsetRelaxSolVal",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), val
)
_SCIPsetRelaxSolVals(scip::SCIP_t, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t) = @scip_ccall_check("SCIPsetRelaxSolVals",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}), 
	pointer(scip), nvars, array(vars), pointer(vals)
)
_SCIPsetRelaxSolValsSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPsetRelaxSolValsSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPmarkRelaxSolValid(scip::SCIP_t) = @scip_ccall_check("SCIPmarkRelaxSolValid",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPmarkRelaxSolInvalid(scip::SCIP_t) = @scip_ccall_check("SCIPmarkRelaxSolInvalid",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPstartStrongbranch(scip::SCIP_t, enablepropagation::_SCIP_Bool) = @scip_ccall_check("SCIPstartStrongbranch",
	(Ptr{_SCIP}, _SCIP_Bool), 
	pointer(scip), enablepropagation
)
_SCIPendStrongbranch(scip::SCIP_t) = @scip_ccall_check("SCIPendStrongbranch",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetVarStrongbranchFrac(scip::SCIP_t, var::SCIP_VAR_t, itlim::Int, down::SCIP_Real_t, up::SCIP_Real_t, downvalid::SCIP_Bool_t, upvalid::SCIP_Bool_t, downinf::SCIP_Bool_t, upinf::SCIP_Bool_t, downconflict::SCIP_Bool_t, upconflict::SCIP_Bool_t, lperror::SCIP_Bool_t) = @scip_ccall_check("SCIPgetVarStrongbranchFrac",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Int, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), itlim, pointer(down), pointer(up), pointer(downvalid), pointer(upvalid), pointer(downinf), pointer(upinf), pointer(downconflict), pointer(upconflict), pointer(lperror)
)
_SCIPgetVarStrongbranchWithPropagation(scip::SCIP_t, var::SCIP_VAR_t, solval::_SCIP_Real, lpobjval::_SCIP_Real, itlim::Int, maxproprounds::Int, down::SCIP_Real_t, up::SCIP_Real_t, downvalid::SCIP_Bool_t, upvalid::SCIP_Bool_t, downinf::SCIP_Bool_t, upinf::SCIP_Bool_t, downconflict::SCIP_Bool_t, upconflict::SCIP_Bool_t, lperror::SCIP_Bool_t, newlbs::SCIP_Real_t, newubs::SCIP_Real_t) = @scip_ccall_check("SCIPgetVarStrongbranchWithPropagation",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, Int, Int, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(var), solval, lpobjval, itlim, maxproprounds, pointer(down), pointer(up), pointer(downvalid), pointer(upvalid), pointer(downinf), pointer(upinf), pointer(downconflict), pointer(upconflict), pointer(lperror), pointer(newlbs), pointer(newubs)
)
_SCIPgetVarStrongbranchInt(scip::SCIP_t, var::SCIP_VAR_t, itlim::Int, down::SCIP_Real_t, up::SCIP_Real_t, downvalid::SCIP_Bool_t, upvalid::SCIP_Bool_t, downinf::SCIP_Bool_t, upinf::SCIP_Bool_t, downconflict::SCIP_Bool_t, upconflict::SCIP_Bool_t, lperror::SCIP_Bool_t) = @scip_ccall_check("SCIPgetVarStrongbranchInt",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Int, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), itlim, pointer(down), pointer(up), pointer(downvalid), pointer(upvalid), pointer(downinf), pointer(upinf), pointer(downconflict), pointer(upconflict), pointer(lperror)
)
_SCIPgetVarsStrongbranchesFrac(scip::SCIP_t, vars::SCIP_VAR_t, nvars::Int, itlim::Int, down::SCIP_Real_t, up::SCIP_Real_t, downvalid::SCIP_Bool_t, upvalid::SCIP_Bool_t, downinf::SCIP_Bool_t, upinf::SCIP_Bool_t, downconflict::SCIP_Bool_t, upconflict::SCIP_Bool_t, lperror::SCIP_Bool_t) = @scip_ccall_check("SCIPgetVarsStrongbranchesFrac",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_VAR}}, Int, Int, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), array(vars), nvars, itlim, pointer(down), pointer(up), pointer(downvalid), pointer(upvalid), pointer(downinf), pointer(upinf), pointer(downconflict), pointer(upconflict), pointer(lperror)
)
_SCIPgetVarsStrongbranchesInt(scip::SCIP_t, vars::SCIP_VAR_t, nvars::Int, itlim::Int, down::SCIP_Real_t, up::SCIP_Real_t, downvalid::SCIP_Bool_t, upvalid::SCIP_Bool_t, downinf::SCIP_Bool_t, upinf::SCIP_Bool_t, downconflict::SCIP_Bool_t, upconflict::SCIP_Bool_t, lperror::SCIP_Bool_t) = @scip_ccall_check("SCIPgetVarsStrongbranchesInt",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_VAR}}, Int, Int, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), array(vars), nvars, itlim, pointer(down), pointer(up), pointer(downvalid), pointer(upvalid), pointer(downinf), pointer(upinf), pointer(downconflict), pointer(upconflict), pointer(lperror)
)
_SCIPgetVarStrongbranchLast(scip::SCIP_t, var::SCIP_VAR_t, down::SCIP_Real_t, up::SCIP_Real_t, downvalid::SCIP_Bool_t, upvalid::SCIP_Bool_t, solval::SCIP_Real_t, lpobjval::SCIP_Real_t) = @scip_ccall_check("SCIPgetVarStrongbranchLast",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(var), pointer(down), pointer(up), pointer(downvalid), pointer(upvalid), pointer(solval), pointer(lpobjval)
)
_SCIPaddVarLocks(scip::SCIP_t, var::SCIP_VAR_t, nlocksdown::Int, nlocksup::Int) = @scip_ccall_check("SCIPaddVarLocks",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Int, Int), 
	pointer(scip), pointer(var), nlocksdown, nlocksup
)
_SCIPlockVarCons(scip::SCIP_t, var::SCIP_VAR_t, cons::SCIP_CONS_t, lockdown::_SCIP_Bool, lockup::_SCIP_Bool) = @scip_ccall_check("SCIPlockVarCons",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_CONS}, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), pointer(var), pointer(cons), lockdown, lockup
)
_SCIPunlockVarCons(scip::SCIP_t, var::SCIP_VAR_t, cons::SCIP_CONS_t, lockdown::_SCIP_Bool, lockup::_SCIP_Bool) = @scip_ccall_check("SCIPunlockVarCons",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_CONS}, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), pointer(var), pointer(cons), lockdown, lockup
)
_SCIPchgVarObj(scip::SCIP_t, var::SCIP_VAR_t, newobj::_SCIP_Real) = @scip_ccall_check("SCIPchgVarObj",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newobj
)
_SCIPaddVarObj(scip::SCIP_t, var::SCIP_VAR_t, addobj::_SCIP_Real) = @scip_ccall_check("SCIPaddVarObj",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), addobj
)
_SCIPchgVarLb(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarLb",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newbound
)
_SCIPchgVarUb(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarUb",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newbound
)
_SCIPchgVarLbNode(scip::SCIP_t, node::SCIP_NODE_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarLbNode",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(node), pointer(var), newbound
)
_SCIPchgVarUbNode(scip::SCIP_t, node::SCIP_NODE_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarUbNode",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(node), pointer(var), newbound
)
_SCIPchgVarLbGlobal(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarLbGlobal",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newbound
)
_SCIPchgVarUbGlobal(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarUbGlobal",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newbound
)
_SCIPchgVarLbLazy(scip::SCIP_t, var::SCIP_VAR_t, lazylb::_SCIP_Real) = @scip_ccall_check("SCIPchgVarLbLazy",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), lazylb
)
_SCIPchgVarUbLazy(scip::SCIP_t, var::SCIP_VAR_t, lazyub::_SCIP_Real) = @scip_ccall_check("SCIPchgVarUbLazy",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), lazyub
)
_SCIPtightenVarLb(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real, force::_SCIP_Bool, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPtightenVarLb",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), newbound, force, pointer(infeasible), pointer(tightened)
)
_SCIPtightenVarUb(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real, force::_SCIP_Bool, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPtightenVarUb",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), newbound, force, pointer(infeasible), pointer(tightened)
)
_SCIPinferVarLbCons(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real, infercons::SCIP_CONS_t, inferinfo::Int, force::_SCIP_Bool, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPinferVarLbCons",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, Ptr{_SCIP_CONS}, Int, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), newbound, pointer(infercons), inferinfo, force, pointer(infeasible), pointer(tightened)
)
_SCIPinferVarUbCons(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real, infercons::SCIP_CONS_t, inferinfo::Int, force::_SCIP_Bool, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPinferVarUbCons",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, Ptr{_SCIP_CONS}, Int, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), newbound, pointer(infercons), inferinfo, force, pointer(infeasible), pointer(tightened)
)
_SCIPinferBinvarCons(scip::SCIP_t, var::SCIP_VAR_t, fixedval::_SCIP_Bool, infercons::SCIP_CONS_t, inferinfo::Int, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPinferBinvarCons",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Bool, Ptr{_SCIP_CONS}, Int, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), fixedval, pointer(infercons), inferinfo, pointer(infeasible), pointer(tightened)
)
_SCIPinferVarLbProp(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real, inferprop::SCIP_PROP_t, inferinfo::Int, force::_SCIP_Bool, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPinferVarLbProp",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, Ptr{_SCIP_PROP}, Int, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), newbound, pointer(inferprop), inferinfo, force, pointer(infeasible), pointer(tightened)
)
_SCIPinferVarUbProp(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real, inferprop::SCIP_PROP_t, inferinfo::Int, force::_SCIP_Bool, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPinferVarUbProp",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, Ptr{_SCIP_PROP}, Int, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), newbound, pointer(inferprop), inferinfo, force, pointer(infeasible), pointer(tightened)
)
_SCIPinferBinvarProp(scip::SCIP_t, var::SCIP_VAR_t, fixedval::_SCIP_Bool, inferprop::SCIP_PROP_t, inferinfo::Int, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPinferBinvarProp",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Bool, Ptr{_SCIP_PROP}, Int, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), fixedval, pointer(inferprop), inferinfo, pointer(infeasible), pointer(tightened)
)
_SCIPtightenVarLbGlobal(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real, force::_SCIP_Bool, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPtightenVarLbGlobal",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), newbound, force, pointer(infeasible), pointer(tightened)
)
_SCIPtightenVarUbGlobal(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real, force::_SCIP_Bool, infeasible::SCIP_Bool_t, tightened::SCIP_Bool_t) = @scip_ccall_check("SCIPtightenVarUbGlobal",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), newbound, force, pointer(infeasible), pointer(tightened)
)
_SCIPwriteCliqueGraph(scip::SCIP_t, fname::String, writeimplications::_SCIP_Bool, writenodeweights::_SCIP_Bool) = @scip_ccall_check("SCIPwriteCliqueGraph",
	(Ptr{_SCIP}, String, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), fname, writeimplications, writenodeweights
)
_SCIPchgVarBranchFactor(scip::SCIP_t, var::SCIP_VAR_t, branchfactor::_SCIP_Real) = @scip_ccall_check("SCIPchgVarBranchFactor",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), branchfactor
)
_SCIPscaleVarBranchFactor(scip::SCIP_t, var::SCIP_VAR_t, scale::_SCIP_Real) = @scip_ccall_check("SCIPscaleVarBranchFactor",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), scale
)
_SCIPaddVarBranchFactor(scip::SCIP_t, var::SCIP_VAR_t, addfactor::_SCIP_Real) = @scip_ccall_check("SCIPaddVarBranchFactor",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), addfactor
)
_SCIPchgVarBranchPriority(scip::SCIP_t, var::SCIP_VAR_t, branchpriority::Int) = @scip_ccall_check("SCIPchgVarBranchPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Int), 
	pointer(scip), pointer(var), branchpriority
)
_SCIPupdateVarBranchPriority(scip::SCIP_t, var::SCIP_VAR_t, branchpriority::Int) = @scip_ccall_check("SCIPupdateVarBranchPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Int), 
	pointer(scip), pointer(var), branchpriority
)
_SCIPaddVarBranchPriority(scip::SCIP_t, var::SCIP_VAR_t, addpriority::Int) = @scip_ccall_check("SCIPaddVarBranchPriority",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Int), 
	pointer(scip), pointer(var), addpriority
)
_SCIPchgVarBranchDirection(scip::SCIP_t, var::SCIP_VAR_t, branchdirection::_SCIP_BRANCHDIR) = @scip_ccall_check("SCIPchgVarBranchDirection",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BRANCHDIR), 
	pointer(scip), pointer(var), branchdirection
)
_SCIPchgVarType(scip::SCIP_t, var::SCIP_VAR_t, vartype::_SCIP_VARTYPE, infeasible::SCIP_Bool_t) = @scip_ccall_check("SCIPchgVarType",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_VARTYPE, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), vartype, pointer(infeasible)
)
_SCIPfixVar(scip::SCIP_t, var::SCIP_VAR_t, fixedval::_SCIP_Real, infeasible::SCIP_Bool_t, fixed::SCIP_Bool_t) = @scip_ccall_check("SCIPfixVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), fixedval, pointer(infeasible), pointer(fixed)
)
_SCIPaggregateVars(scip::SCIP_t, varx::SCIP_VAR_t, vary::SCIP_VAR_t, scalarx::_SCIP_Real, scalary::_SCIP_Real, rhs::_SCIP_Real, infeasible::SCIP_Bool_t, redundant::SCIP_Bool_t, aggregated::SCIP_Bool_t) = @scip_ccall_check("SCIPaggregateVars",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(varx), pointer(vary), scalarx, scalary, rhs, pointer(infeasible), pointer(redundant), pointer(aggregated)
)
_SCIPmultiaggregateVar(scip::SCIP_t, var::SCIP_VAR_t, naggvars::Int, aggvars::SCIP_VAR_t, scalars::SCIP_Real_t, constant::_SCIP_Real, infeasible::SCIP_Bool_t, aggregated::SCIP_Bool_t) = @scip_ccall_check("SCIPmultiaggregateVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, _SCIP_Real, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), naggvars, array(aggvars), pointer(scalars), constant, pointer(infeasible), pointer(aggregated)
)
_SCIPmarkDoNotMultaggrVar(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPmarkDoNotMultaggrVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPupdateVarPseudocost(scip::SCIP_t, var::SCIP_VAR_t, solvaldelta::_SCIP_Real, objdelta::_SCIP_Real, weight::_SCIP_Real) = @scip_ccall_check("SCIPupdateVarPseudocost",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real), 
	pointer(scip), pointer(var), solvaldelta, objdelta, weight
)
_SCIPinitVarBranchStats(scip::SCIP_t, var::SCIP_VAR_t, downpscost::_SCIP_Real, uppscost::_SCIP_Real, downvsids::_SCIP_Real, upvsids::_SCIP_Real, downconflen::_SCIP_Real, upconflen::_SCIP_Real, downinfer::_SCIP_Real, upinfer::_SCIP_Real, downcutoff::_SCIP_Real, upcutoff::_SCIP_Real) = @scip_ccall_check("SCIPinitVarBranchStats",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real), 
	pointer(scip), pointer(var), downpscost, uppscost, downvsids, upvsids, downconflen, upconflen, downinfer, upinfer, downcutoff, upcutoff
)
_SCIPinitConflictAnalysis(scip::SCIP_t) = @scip_ccall_check("SCIPinitConflictAnalysis",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPaddConflictLb(scip::SCIP_t, var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t) = @scip_ccall_check("SCIPaddConflictLb",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}), 
	pointer(scip), pointer(var), pointer(bdchgidx)
)
_SCIPaddConflictRelaxedLb(scip::SCIP_t, var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t, relaxedlb::_SCIP_Real) = @scip_ccall_check("SCIPaddConflictRelaxedLb",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}, _SCIP_Real), 
	pointer(scip), pointer(var), pointer(bdchgidx), relaxedlb
)
_SCIPaddConflictUb(scip::SCIP_t, var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t) = @scip_ccall_check("SCIPaddConflictUb",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}), 
	pointer(scip), pointer(var), pointer(bdchgidx)
)
_SCIPaddConflictRelaxedUb(scip::SCIP_t, var::SCIP_VAR_t, bdchgidx::SCIP_BDCHGIDX_t, relaxedub::_SCIP_Real) = @scip_ccall_check("SCIPaddConflictRelaxedUb",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{_SCIP_BDCHGIDX}, _SCIP_Real), 
	pointer(scip), pointer(var), pointer(bdchgidx), relaxedub
)
_SCIPaddConflictBd(scip::SCIP_t, var::SCIP_VAR_t, boundtype::_SCIP_BOUNDTYPE, bdchgidx::SCIP_BDCHGIDX_t) = @scip_ccall_check("SCIPaddConflictBd",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BOUNDTYPE, Ptr{_SCIP_BDCHGIDX}), 
	pointer(scip), pointer(var), boundtype, pointer(bdchgidx)
)
_SCIPaddConflictRelaxedBd(scip::SCIP_t, var::SCIP_VAR_t, boundtype::_SCIP_BOUNDTYPE, bdchgidx::SCIP_BDCHGIDX_t, relaxedbd::_SCIP_Real) = @scip_ccall_check("SCIPaddConflictRelaxedBd",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BOUNDTYPE, Ptr{_SCIP_BDCHGIDX}, _SCIP_Real), 
	pointer(scip), pointer(var), boundtype, pointer(bdchgidx), relaxedbd
)
_SCIPaddConflictBinvar(scip::SCIP_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPaddConflictBinvar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(var)
)
_SCIPisConflictVarUsed(scip::SCIP_t, var::SCIP_VAR_t, boundtype::_SCIP_BOUNDTYPE, bdchgidx::SCIP_BDCHGIDX_t, used::SCIP_Bool_t) = @scip_ccall_check("SCIPisConflictVarUsed",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_BOUNDTYPE, Ptr{_SCIP_BDCHGIDX}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(var), boundtype, pointer(bdchgidx), pointer(used)
)
_SCIPanalyzeConflict(scip::SCIP_t, validdepth::Int, success::SCIP_Bool_t) = @scip_ccall_check("SCIPanalyzeConflict",
	(Ptr{_SCIP}, Int, Ptr{_SCIP_Bool}), 
	pointer(scip), validdepth, pointer(success)
)
_SCIPanalyzeConflictCons(scip::SCIP_t, cons::SCIP_CONS_t, success::SCIP_Bool_t) = @scip_ccall_check("SCIPanalyzeConflictCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(cons), pointer(success)
)
_SCIPcreateCons(scip::SCIP_t, cons::SCIP_CONS_t, name::String, conshdlr::SCIP_CONSHDLR_t, consdata::SCIP_CONSDATA_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateCons",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_CONSHDLR}, Ptr{_SCIP_CONSDATA}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(conshdlr), pointer(consdata), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPparseCons(scip::SCIP_t, cons::SCIP_CONS_t, str::String, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool, success::SCIP_Bool_t) = @scip_ccall_check("SCIPparseCons",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(scip), array(cons), str, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode, pointer(success)
)
_SCIPcaptureCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPcaptureCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPreleaseCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPreleaseCons",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}), 
	pointer(scip), array(cons)
)
_SCIPchgConsName(scip::SCIP_t, cons::SCIP_CONS_t, name::String) = @scip_ccall_check("SCIPchgConsName",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, String), 
	pointer(scip), pointer(cons), name
)
_SCIPsetConsInitial(scip::SCIP_t, cons::SCIP_CONS_t, initial::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsInitial",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), initial
)
_SCIPsetConsSeparated(scip::SCIP_t, cons::SCIP_CONS_t, separate::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsSeparated",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), separate
)
_SCIPsetConsEnforced(scip::SCIP_t, cons::SCIP_CONS_t, enforce::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsEnforced",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), enforce
)
_SCIPsetConsChecked(scip::SCIP_t, cons::SCIP_CONS_t, check::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsChecked",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), check
)
_SCIPsetConsPropagated(scip::SCIP_t, cons::SCIP_CONS_t, propagate::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsPropagated",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), propagate
)
_SCIPsetConsLocal(scip::SCIP_t, cons::SCIP_CONS_t, localVar::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsLocal",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), localVar
)
_SCIPsetConsModifiable(scip::SCIP_t, cons::SCIP_CONS_t, modifiable::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsModifiable",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), modifiable
)
_SCIPsetConsDynamic(scip::SCIP_t, cons::SCIP_CONS_t, dynamic::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsDynamic",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), dynamic
)
_SCIPsetConsRemovable(scip::SCIP_t, cons::SCIP_CONS_t, removable::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsRemovable",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), removable
)
_SCIPsetConsStickingAtNode(scip::SCIP_t, cons::SCIP_CONS_t, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPsetConsStickingAtNode",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool), 
	pointer(scip), pointer(cons), stickingatnode
)
_SCIPupdateConsFlags(scip::SCIP_t, cons0::SCIP_CONS_t, cons1::SCIP_CONS_t) = @scip_ccall_check("SCIPupdateConsFlags",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons0), pointer(cons1)
)
_SCIPtransformCons(scip::SCIP_t, cons::SCIP_CONS_t, transcons::SCIP_CONS_t) = @scip_ccall_check("SCIPtransformCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_CONS}}), 
	pointer(scip), pointer(cons), array(transcons)
)
_SCIPtransformConss(scip::SCIP_t, nconss::Int, conss::SCIP_CONS_t, transconss::SCIP_CONS_t) = @scip_ccall_check("SCIPtransformConss",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_CONS}}, Ptr{Ptr{_SCIP_CONS}}), 
	pointer(scip), nconss, array(conss), array(transconss)
)
_SCIPgetTransformedCons(scip::SCIP_t, cons::SCIP_CONS_t, transcons::SCIP_CONS_t) = @scip_ccall_check("SCIPgetTransformedCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_CONS}}), 
	pointer(scip), pointer(cons), array(transcons)
)
_SCIPgetTransformedConss(scip::SCIP_t, nconss::Int, conss::SCIP_CONS_t, transconss::SCIP_CONS_t) = @scip_ccall_check("SCIPgetTransformedConss",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_CONS}}, Ptr{Ptr{_SCIP_CONS}}), 
	pointer(scip), nconss, array(conss), array(transconss)
)
_SCIPaddConsAge(scip::SCIP_t, cons::SCIP_CONS_t, deltaage::_SCIP_Real) = @scip_ccall_check("SCIPaddConsAge",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Real), 
	pointer(scip), pointer(cons), deltaage
)
_SCIPincConsAge(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPincConsAge",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPresetConsAge(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPresetConsAge",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPenableCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPenableCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPdisableCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPdisableCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPenableConsSeparation(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPenableConsSeparation",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPdisableConsSeparation(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPdisableConsSeparation",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPenableConsPropagation(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPenableConsPropagation",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPdisableConsPropagation(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPdisableConsPropagation",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPmarkConsPropagate(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPmarkConsPropagate",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPunmarkConsPropagate(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPunmarkConsPropagate",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPaddConsLocks(scip::SCIP_t, cons::SCIP_CONS_t, nlockspos::Int, nlocksneg::Int) = @scip_ccall_check("SCIPaddConsLocks",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Int, Int), 
	pointer(scip), pointer(cons), nlockspos, nlocksneg
)
_SCIPcheckCons(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t, checkintegrality::_SCIP_Bool, checklprows::_SCIP_Bool, printreason::_SCIP_Bool, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPcheckCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cons), pointer(sol), checkintegrality, checklprows, printreason, pointer(result)
)
_SCIPenfopsCons(scip::SCIP_t, cons::SCIP_CONS_t, solinfeasible::_SCIP_Bool, objinfeasible::_SCIP_Bool, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPenfopsCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cons), solinfeasible, objinfeasible, pointer(result)
)
_SCIPenfolpCons(scip::SCIP_t, cons::SCIP_CONS_t, solinfeasible::_SCIP_Bool, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPenfolpCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cons), solinfeasible, pointer(result)
)
_SCIPinitlpCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPinitlpCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPsepalpCons(scip::SCIP_t, cons::SCIP_CONS_t, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPsepalpCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cons), pointer(result)
)
_SCIPsepasolCons(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPsepasolCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cons), pointer(sol), pointer(result)
)
_SCIPpropCons(scip::SCIP_t, cons::SCIP_CONS_t, proptiming::_SCIP_PROPTIMING, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPpropCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_PROPTIMING, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cons), proptiming, pointer(result)
)
_SCIPrespropCons(scip::SCIP_t, cons::SCIP_CONS_t, infervar::SCIP_VAR_t, inferinfo::Int, boundtype::_SCIP_BOUNDTYPE, bdchgidx::SCIP_BDCHGIDX_t, relaxedbd::_SCIP_Real, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPrespropCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, Int, _SCIP_BOUNDTYPE, Ptr{_SCIP_BDCHGIDX}, _SCIP_Real, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cons), pointer(infervar), inferinfo, boundtype, pointer(bdchgidx), relaxedbd, pointer(result)
)
_SCIPactiveCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPactiveCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPdeactiveCons(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPdeactiveCons",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetConsVars(scip::SCIP_t, cons::SCIP_CONS_t, vars::SCIP_VAR_t, varssize::Int, success::SCIP_Bool_t) = @scip_ccall_check("SCIPgetConsVars",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_VAR}}, Int, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(cons), array(vars), varssize, pointer(success)
)
_SCIPconstructLP(scip::SCIP_t, cutoff::SCIP_Bool_t) = @scip_ccall_check("SCIPconstructLP",
	(Ptr{_SCIP}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(cutoff)
)
_SCIPflushLP(scip::SCIP_t) = @scip_ccall_check("SCIPflushLP",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetLPBInvRow(scip::SCIP_t, r::Int, coef::SCIP_Real_t) = @scip_ccall_check("SCIPgetLPBInvRow",
	(Ptr{_SCIP}, Int, Ptr{_SCIP_Real}), 
	pointer(scip), r, pointer(coef)
)
_SCIPgetLPBInvCol(scip::SCIP_t, c::Int, coef::SCIP_Real_t) = @scip_ccall_check("SCIPgetLPBInvCol",
	(Ptr{_SCIP}, Int, Ptr{_SCIP_Real}), 
	pointer(scip), c, pointer(coef)
)
_SCIPgetLPBInvARow(scip::SCIP_t, r::Int, binvrow::SCIP_Real_t, coef::SCIP_Real_t) = @scip_ccall_check("SCIPgetLPBInvARow",
	(Ptr{_SCIP}, Int, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(scip), r, pointer(binvrow), pointer(coef)
)
_SCIPgetLPBInvACol(scip::SCIP_t, c::Int, coef::SCIP_Real_t) = @scip_ccall_check("SCIPgetLPBInvACol",
	(Ptr{_SCIP}, Int, Ptr{_SCIP_Real}), 
	pointer(scip), c, pointer(coef)
)
_SCIPsumLPRows(scip::SCIP_t, weights::SCIP_Real_t, sumcoef::SCIP_REALARRAY_t, sumlhs::SCIP_Real_t, sumrhs::SCIP_Real_t) = @scip_ccall_check("SCIPsumLPRows",
	(Ptr{_SCIP}, Ptr{_SCIP_Real}, Ptr{_SCIP_REALARRAY}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(weights), pointer(sumcoef), pointer(sumlhs), pointer(sumrhs)
)
_SCIPwriteLP(scip::SCIP_t, filename::String) = @scip_ccall_check("SCIPwriteLP",
	(Ptr{_SCIP}, String), 
	pointer(scip), filename
)
_SCIPwriteMIP(scip::SCIP_t, filename::String, genericnames::_SCIP_Bool, origobj::_SCIP_Bool, lazyconss::_SCIP_Bool) = @scip_ccall_check("SCIPwriteMIP",
	(Ptr{_SCIP}, String, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), filename, genericnames, origobj, lazyconss
)
_SCIPgetLPI(scip::SCIP_t, lpi::SCIP_LPI_t) = @scip_ccall_check("SCIPgetLPI",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_LPI}}), 
	pointer(scip), array(lpi)
)
_SCIPcomputeLPRelIntPoint(scip::SCIP_t, relaxrows::_SCIP_Bool, inclobjcutoff::_SCIP_Bool, timelimit::_SCIP_Real, iterlimit::Int, point::SCIP_SOL_t) = @scip_ccall_check("SCIPcomputeLPRelIntPoint",
	(Ptr{_SCIP}, _SCIP_Bool, _SCIP_Bool, _SCIP_Real, Int, Ptr{Ptr{_SCIP_SOL}}), 
	pointer(scip), relaxrows, inclobjcutoff, timelimit, iterlimit, array(point)
)
_SCIPcreateRowCons(scip::SCIP_t, row::SCIP_ROW_t, conshdlr::SCIP_CONSHDLR_t, name::String, len::Int, cols::SCIP_COL_t, vals::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateRowCons",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}, Ptr{_SCIP_CONSHDLR}, String, Int, Ptr{Ptr{_SCIP_COL}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(row), pointer(conshdlr), name, len, array(cols), pointer(vals), lhs, rhs, localVar, modifiable, removable
)
_SCIPcreateRowSepa(scip::SCIP_t, row::SCIP_ROW_t, sepa::SCIP_SEPA_t, name::String, len::Int, cols::SCIP_COL_t, vals::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateRowSepa",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}, Ptr{_SCIP_SEPA}, String, Int, Ptr{Ptr{_SCIP_COL}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(row), pointer(sepa), name, len, array(cols), pointer(vals), lhs, rhs, localVar, modifiable, removable
)
_SCIPcreateRowUnspec(scip::SCIP_t, row::SCIP_ROW_t, name::String, len::Int, cols::SCIP_COL_t, vals::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateRowUnspec",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}, String, Int, Ptr{Ptr{_SCIP_COL}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(row), name, len, array(cols), pointer(vals), lhs, rhs, localVar, modifiable, removable
)
_SCIPcreateRow(scip::SCIP_t, row::SCIP_ROW_t, name::String, len::Int, cols::SCIP_COL_t, vals::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateRow",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}, String, Int, Ptr{Ptr{_SCIP_COL}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(row), name, len, array(cols), pointer(vals), lhs, rhs, localVar, modifiable, removable
)
_SCIPcreateEmptyRowCons(scip::SCIP_t, row::SCIP_ROW_t, conshdlr::SCIP_CONSHDLR_t, name::String, lhs::_SCIP_Real, rhs::_SCIP_Real, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateEmptyRowCons",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}, Ptr{_SCIP_CONSHDLR}, String, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(row), pointer(conshdlr), name, lhs, rhs, localVar, modifiable, removable
)
_SCIPcreateEmptyRowSepa(scip::SCIP_t, row::SCIP_ROW_t, sepa::SCIP_SEPA_t, name::String, lhs::_SCIP_Real, rhs::_SCIP_Real, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateEmptyRowSepa",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}, Ptr{_SCIP_SEPA}, String, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(row), pointer(sepa), name, lhs, rhs, localVar, modifiable, removable
)
_SCIPcreateEmptyRowUnspec(scip::SCIP_t, row::SCIP_ROW_t, name::String, lhs::_SCIP_Real, rhs::_SCIP_Real, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateEmptyRowUnspec",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}, String, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(row), name, lhs, rhs, localVar, modifiable, removable
)
_SCIPcreateEmptyRow(scip::SCIP_t, row::SCIP_ROW_t, name::String, lhs::_SCIP_Real, rhs::_SCIP_Real, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, removable::_SCIP_Bool) = @scip_ccall_check("SCIPcreateEmptyRow",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}, String, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(row), name, lhs, rhs, localVar, modifiable, removable
)
_SCIPcaptureRow(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPcaptureRow",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPreleaseRow(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPreleaseRow",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_ROW}}), 
	pointer(scip), array(row)
)
_SCIPchgRowLhs(scip::SCIP_t, row::SCIP_ROW_t, lhs::_SCIP_Real) = @scip_ccall_check("SCIPchgRowLhs",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, _SCIP_Real), 
	pointer(scip), pointer(row), lhs
)
_SCIPchgRowRhs(scip::SCIP_t, row::SCIP_ROW_t, rhs::_SCIP_Real) = @scip_ccall_check("SCIPchgRowRhs",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, _SCIP_Real), 
	pointer(scip), pointer(row), rhs
)
_SCIPcacheRowExtensions(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPcacheRowExtensions",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPflushRowExtensions(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPflushRowExtensions",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPaddVarToRow(scip::SCIP_t, row::SCIP_ROW_t, var::SCIP_VAR_t, val::_SCIP_Real) = @scip_ccall_check("SCIPaddVarToRow",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(row), pointer(var), val
)
_SCIPaddVarsToRow(scip::SCIP_t, row::SCIP_ROW_t, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t) = @scip_ccall_check("SCIPaddVarsToRow",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(row), nvars, array(vars), pointer(vals)
)
_SCIPaddVarsToRowSameCoef(scip::SCIP_t, row::SCIP_ROW_t, nvars::Int, vars::SCIP_VAR_t, val::_SCIP_Real) = @scip_ccall_check("SCIPaddVarsToRowSameCoef",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, Int, Ptr{Ptr{_SCIP_VAR}}, _SCIP_Real), 
	pointer(scip), pointer(row), nvars, array(vars), val
)
_SCIPcalcRowIntegralScalar(scip::SCIP_t, row::SCIP_ROW_t, mindelta::_SCIP_Real, maxdelta::_SCIP_Real, maxdnom::Int64, maxscale::_SCIP_Real, usecontvars::_SCIP_Bool, intscalar::SCIP_Real_t, success::SCIP_Bool_t) = @scip_ccall_check("SCIPcalcRowIntegralScalar",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, _SCIP_Real, _SCIP_Real, Int64, _SCIP_Real, _SCIP_Bool, Ptr{_SCIP_Real}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(row), mindelta, maxdelta, maxdnom, maxscale, usecontvars, pointer(intscalar), pointer(success)
)
_SCIPmakeRowIntegral(scip::SCIP_t, row::SCIP_ROW_t, mindelta::_SCIP_Real, maxdelta::_SCIP_Real, maxdnom::Int64, maxscale::_SCIP_Real, usecontvars::_SCIP_Bool, success::SCIP_Bool_t) = @scip_ccall_check("SCIPmakeRowIntegral",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, _SCIP_Real, _SCIP_Real, Int64, _SCIP_Real, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(row), mindelta, maxdelta, maxdnom, maxscale, usecontvars, pointer(success)
)
_SCIPrecalcRowLPActivity(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPrecalcRowLPActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPrecalcRowPseudoActivity(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPrecalcRowPseudoActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPrecalcRowActivity(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPrecalcRowActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPaddNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPaddNlRow",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}), 
	pointer(scip), pointer(nlrow)
)
_SCIPflushNLP(scip::SCIP_t) = @scip_ccall_check("SCIPflushNLP",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsetNLPInitialGuess(scip::SCIP_t, initialguess::SCIP_Real_t) = @scip_ccall_check("SCIPsetNLPInitialGuess",
	(Ptr{_SCIP}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(initialguess)
)
_SCIPsetNLPInitialGuessSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPsetNLPInitialGuessSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPsolveNLP(scip::SCIP_t) = @scip_ccall_check("SCIPsolveNLP",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPgetNLPStatistics(scip::SCIP_t, statistics::SCIP_NLPSTATISTICS_t) = @scip_ccall_check("SCIPgetNLPStatistics",
	(Ptr{_SCIP}, Ptr{_SCIP_NLPSTATISTICS}), 
	pointer(scip), pointer(statistics)
)
_SCIPsetNLPIntPar(scip::SCIP_t, typeVar::_SCIP_NLPPARAM, ival::Int) = @scip_ccall_check("SCIPsetNLPIntPar",
	(Ptr{_SCIP}, _SCIP_NLPPARAM, Int), 
	pointer(scip), typeVar, ival
)
_SCIPgetNLPRealPar(scip::SCIP_t, typeVar::_SCIP_NLPPARAM, dval::SCIP_Real_t) = @scip_ccall_check("SCIPgetNLPRealPar",
	(Ptr{_SCIP}, _SCIP_NLPPARAM, Ptr{_SCIP_Real}), 
	pointer(scip), typeVar, pointer(dval)
)
_SCIPsetNLPRealPar(scip::SCIP_t, typeVar::_SCIP_NLPPARAM, dval::_SCIP_Real) = @scip_ccall_check("SCIPsetNLPRealPar",
	(Ptr{_SCIP}, _SCIP_NLPPARAM, _SCIP_Real), 
	pointer(scip), typeVar, dval
)
_SCIPsetNLPStringPar(scip::SCIP_t, typeVar::_SCIP_NLPPARAM, sval::String) = @scip_ccall_check("SCIPsetNLPStringPar",
	(Ptr{_SCIP}, _SCIP_NLPPARAM, String), 
	pointer(scip), typeVar, sval
)
_SCIPwriteNLP(scip::SCIP_t, filename::String) = @scip_ccall_check("SCIPwriteNLP",
	(Ptr{_SCIP}, String), 
	pointer(scip), filename
)
_SCIPgetNLPI(scip::SCIP_t, nlpi::SCIP_NLPI_t, nlpiproblem::SCIP_NLPIPROBLEM_t) = @scip_ccall_check("SCIPgetNLPI",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_NLPI}}, Ptr{Ptr{_SCIP_NLPIPROBLEM}}), 
	pointer(scip), array(nlpi), array(nlpiproblem)
)
_SCIPstartDiveNLP(scip::SCIP_t) = @scip_ccall_check("SCIPstartDiveNLP",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPendDiveNLP(scip::SCIP_t) = @scip_ccall_check("SCIPendDiveNLP",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPchgVarObjDiveNLP(scip::SCIP_t, var::SCIP_VAR_t, coef::_SCIP_Real) = @scip_ccall_check("SCIPchgVarObjDiveNLP",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), coef
)
_SCIPchgVarBoundsDiveNLP(scip::SCIP_t, var::SCIP_VAR_t, lb::_SCIP_Real, ub::_SCIP_Real) = @scip_ccall_check("SCIPchgVarBoundsDiveNLP",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), pointer(var), lb, ub
)
_SCIPchgVarsBoundsDiveNLP(scip::SCIP_t, nvars::Int, vars::SCIP_VAR_t, lbs::SCIP_Real_t, ubs::SCIP_Real_t) = @scip_ccall_check("SCIPchgVarsBoundsDiveNLP",
	(Ptr{_SCIP}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(scip), nvars, array(vars), pointer(lbs), pointer(ubs)
)
_SCIPsolveDiveNLP(scip::SCIP_t) = @scip_ccall_check("SCIPsolveDiveNLP",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, name::String, constant::_SCIP_Real, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, nquadvars::Int, quadvars::SCIP_VAR_t, nquadelems::Int, quadelems::SCIP_QUADELEM_t, expression::SCIP_EXPRTREE_t, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateNlRow",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_NLROW}}, String, _SCIP_Real, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Int, Ptr{Ptr{_SCIP_VAR}}, Int, Ptr{_SCIP_QUADELEM}, Ptr{_SCIP_EXPRTREE}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(nlrow), name, constant, nlinvars, array(linvars), pointer(lincoefs), nquadvars, array(quadvars), nquadelems, pointer(quadelems), pointer(expression), lhs, rhs
)
_SCIPcreateEmptyNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, name::String, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateEmptyNlRow",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_NLROW}}, String, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(nlrow), name, lhs, rhs
)
_SCIPcreateNlRowFromRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPcreateNlRowFromRow",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_NLROW}}, Ptr{_SCIP_ROW}), 
	pointer(scip), array(nlrow), pointer(row)
)
_SCIPcaptureNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPcaptureNlRow",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}), 
	pointer(scip), pointer(nlrow)
)
_SCIPreleaseNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPreleaseNlRow",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_NLROW}}), 
	pointer(scip), array(nlrow)
)
_SCIPchgNlRowLhs(scip::SCIP_t, nlrow::SCIP_NLROW_t, lhs::_SCIP_Real) = @scip_ccall_check("SCIPchgNlRowLhs",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, _SCIP_Real), 
	pointer(scip), pointer(nlrow), lhs
)
_SCIPchgNlRowRhs(scip::SCIP_t, nlrow::SCIP_NLROW_t, rhs::_SCIP_Real) = @scip_ccall_check("SCIPchgNlRowRhs",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, _SCIP_Real), 
	pointer(scip), pointer(nlrow), rhs
)
_SCIPchgNlRowConstant(scip::SCIP_t, nlrow::SCIP_NLROW_t, constant::_SCIP_Real) = @scip_ccall_check("SCIPchgNlRowConstant",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, _SCIP_Real), 
	pointer(scip), pointer(nlrow), constant
)
_SCIPaddLinearCoefToNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, var::SCIP_VAR_t, val::_SCIP_Real) = @scip_ccall_check("SCIPaddLinearCoefToNlRow",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(nlrow), pointer(var), val
)
_SCIPaddLinearCoefsToNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t) = @scip_ccall_check("SCIPaddLinearCoefsToNlRow",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), nvars, array(vars), pointer(vals)
)
_SCIPchgNlRowLinearCoef(scip::SCIP_t, nlrow::SCIP_NLROW_t, var::SCIP_VAR_t, coef::_SCIP_Real) = @scip_ccall_check("SCIPchgNlRowLinearCoef",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(nlrow), pointer(var), coef
)
_SCIPaddQuadVarToNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPaddQuadVarToNlRow",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(nlrow), pointer(var)
)
_SCIPaddQuadVarsToNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPaddQuadVarsToNlRow",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), pointer(nlrow), nvars, array(vars)
)
_SCIPaddQuadElementToNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, quadelem::_SCIP_QUADELEM) = @scip_ccall_check("SCIPaddQuadElementToNlRow",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, _SCIP_QUADELEM), 
	pointer(scip), pointer(nlrow), quadelem
)
_SCIPaddQuadElementsToNlRow(scip::SCIP_t, nlrow::SCIP_NLROW_t, nquadelems::Int, quadelems::SCIP_QUADELEM_t) = @scip_ccall_check("SCIPaddQuadElementsToNlRow",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Int, Ptr{_SCIP_QUADELEM}), 
	pointer(scip), pointer(nlrow), nquadelems, pointer(quadelems)
)
_SCIPchgNlRowQuadElement(scip::SCIP_t, nlrow::SCIP_NLROW_t, quadelement::_SCIP_QUADELEM) = @scip_ccall_check("SCIPchgNlRowQuadElement",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, _SCIP_QUADELEM), 
	pointer(scip), pointer(nlrow), quadelement
)
_SCIPsetNlRowExprtree(scip::SCIP_t, nlrow::SCIP_NLROW_t, exprtree::SCIP_EXPRTREE_t) = @scip_ccall_check("SCIPsetNlRowExprtree",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_EXPRTREE}), 
	pointer(scip), pointer(nlrow), pointer(exprtree)
)
_SCIPsetNlRowExprtreeParam(scip::SCIP_t, nlrow::SCIP_NLROW_t, paramidx::Int, paramval::_SCIP_Real) = @scip_ccall_check("SCIPsetNlRowExprtreeParam",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Int, _SCIP_Real), 
	pointer(scip), pointer(nlrow), paramidx, paramval
)
_SCIPsetNlRowExprtreeParams(scip::SCIP_t, nlrow::SCIP_NLROW_t, paramvals::SCIP_Real_t) = @scip_ccall_check("SCIPsetNlRowExprtreeParams",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(paramvals)
)
_SCIPrecalcNlRowNLPActivity(scip::SCIP_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPrecalcNlRowNLPActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}), 
	pointer(scip), pointer(nlrow)
)
_SCIPgetNlRowNLPActivity(scip::SCIP_t, nlrow::SCIP_NLROW_t, activity::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowNLPActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(activity)
)
_SCIPgetNlRowNLPFeasibility(scip::SCIP_t, nlrow::SCIP_NLROW_t, feasibility::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowNLPFeasibility",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(feasibility)
)
_SCIPrecalcNlRowPseudoActivity(scip::SCIP_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPrecalcNlRowPseudoActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}), 
	pointer(scip), pointer(nlrow)
)
_SCIPgetNlRowPseudoActivity(scip::SCIP_t, nlrow::SCIP_NLROW_t, pseudoactivity::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowPseudoActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(pseudoactivity)
)
_SCIPgetNlRowPseudoFeasibility(scip::SCIP_t, nlrow::SCIP_NLROW_t, pseudofeasibility::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowPseudoFeasibility",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(pseudofeasibility)
)
_SCIPrecalcNlRowActivity(scip::SCIP_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPrecalcNlRowActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}), 
	pointer(scip), pointer(nlrow)
)
_SCIPgetNlRowActivity(scip::SCIP_t, nlrow::SCIP_NLROW_t, activity::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(activity)
)
_SCIPgetNlRowFeasibility(scip::SCIP_t, nlrow::SCIP_NLROW_t, feasibility::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowFeasibility",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(feasibility)
)
_SCIPgetNlRowSolActivity(scip::SCIP_t, nlrow::SCIP_NLROW_t, sol::SCIP_SOL_t, activity::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowSolActivity",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(sol), pointer(activity)
)
_SCIPgetNlRowSolFeasibility(scip::SCIP_t, nlrow::SCIP_NLROW_t, sol::SCIP_SOL_t, feasibility::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowSolFeasibility",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(sol), pointer(feasibility)
)
_SCIPgetNlRowActivityBounds(scip::SCIP_t, nlrow::SCIP_NLROW_t, minactivity::SCIP_Real_t, maxactivity::SCIP_Real_t) = @scip_ccall_check("SCIPgetNlRowActivityBounds",
	(Ptr{_SCIP}, Ptr{_SCIP_NLROW}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(nlrow), pointer(minactivity), pointer(maxactivity)
)
_SCIPgetExprtreeTransformedVars(scip::SCIP_t, tree::SCIP_EXPRTREE_t) = @scip_ccall_check("SCIPgetExprtreeTransformedVars",
	(Ptr{_SCIP}, Ptr{_SCIP_EXPRTREE}), 
	pointer(scip), pointer(tree)
)
_SCIPevalExprtreeSol(scip::SCIP_t, tree::SCIP_EXPRTREE_t, sol::SCIP_SOL_t, val::SCIP_Real_t) = @scip_ccall_check("SCIPevalExprtreeSol",
	(Ptr{_SCIP}, Ptr{_SCIP_EXPRTREE}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(tree), pointer(sol), pointer(val)
)
_SCIPevalExprtreeGlobalBounds(scip::SCIP_t, tree::SCIP_EXPRTREE_t, infinity::_SCIP_Real, val::SCIP_INTERVAL_t) = @scip_ccall_check("SCIPevalExprtreeGlobalBounds",
	(Ptr{_SCIP}, Ptr{_SCIP_EXPRTREE}, _SCIP_Real, Ptr{_SCIP_INTERVAL}), 
	pointer(scip), pointer(tree), infinity, pointer(val)
)
_SCIPevalExprtreeLocalBounds(scip::SCIP_t, tree::SCIP_EXPRTREE_t, infinity::_SCIP_Real, val::SCIP_INTERVAL_t) = @scip_ccall_check("SCIPevalExprtreeLocalBounds",
	(Ptr{_SCIP}, Ptr{_SCIP_EXPRTREE}, _SCIP_Real, Ptr{_SCIP_INTERVAL}), 
	pointer(scip), pointer(tree), infinity, pointer(val)
)
_SCIPaddCut(scip::SCIP_t, sol::SCIP_SOL_t, cut::SCIP_ROW_t, forcecut::_SCIP_Bool, infeasible::SCIP_Bool_t) = @scip_ccall_check("SCIPaddCut",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_ROW}, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(sol), pointer(cut), forcecut, pointer(infeasible)
)
_SCIPaddPoolCut(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPaddPoolCut",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPdelPoolCut(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPdelPoolCut",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPcreateCutpool(scip::SCIP_t, cutpool::SCIP_CUTPOOL_t, agelimit::Int) = @scip_ccall_check("SCIPcreateCutpool",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CUTPOOL}}, Int), 
	pointer(scip), array(cutpool), agelimit
)
_SCIPfreeCutpool(scip::SCIP_t, cutpool::SCIP_CUTPOOL_t) = @scip_ccall_check("SCIPfreeCutpool",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CUTPOOL}}), 
	pointer(scip), array(cutpool)
)
_SCIPaddRowCutpool(scip::SCIP_t, cutpool::SCIP_CUTPOOL_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPaddRowCutpool",
	(Ptr{_SCIP}, Ptr{_SCIP_CUTPOOL}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(cutpool), pointer(row)
)
_SCIPaddNewRowCutpool(scip::SCIP_t, cutpool::SCIP_CUTPOOL_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPaddNewRowCutpool",
	(Ptr{_SCIP}, Ptr{_SCIP_CUTPOOL}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(cutpool), pointer(row)
)
_SCIPdelRowCutpool(scip::SCIP_t, cutpool::SCIP_CUTPOOL_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPdelRowCutpool",
	(Ptr{_SCIP}, Ptr{_SCIP_CUTPOOL}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(cutpool), pointer(row)
)
_SCIPseparateCutpool(scip::SCIP_t, cutpool::SCIP_CUTPOOL_t, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPseparateCutpool",
	(Ptr{_SCIP}, Ptr{_SCIP_CUTPOOL}, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cutpool), pointer(result)
)
_SCIPseparateSolCutpool(scip::SCIP_t, cutpool::SCIP_CUTPOOL_t, sol::SCIP_SOL_t, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPseparateSolCutpool",
	(Ptr{_SCIP}, Ptr{_SCIP_CUTPOOL}, Ptr{_SCIP_SOL}, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(cutpool), pointer(sol), pointer(result)
)
_SCIPaddDelayedPoolCut(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPaddDelayedPoolCut",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPdelDelayedPoolCut(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPdelDelayedPoolCut",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPseparateSol(scip::SCIP_t, sol::SCIP_SOL_t, pretendroot::_SCIP_Bool, onlydelayed::_SCIP_Bool, delayed::SCIP_Bool_t, cutoff::SCIP_Bool_t) = @scip_ccall_check("SCIPseparateSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(sol), pretendroot, onlydelayed, pointer(delayed), pointer(cutoff)
)
_SCIPclearCuts(scip::SCIP_t) = @scip_ccall_check("SCIPclearCuts",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPremoveInefficaciousCuts(scip::SCIP_t) = @scip_ccall_check("SCIPremoveInefficaciousCuts",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPstartDive(scip::SCIP_t) = @scip_ccall_check("SCIPstartDive",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPendDive(scip::SCIP_t) = @scip_ccall_check("SCIPendDive",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPchgCutoffboundDive(scip::SCIP_t, newcutoffbound::_SCIP_Real) = @scip_ccall_check("SCIPchgCutoffboundDive",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), newcutoffbound
)
_SCIPchgVarObjDive(scip::SCIP_t, var::SCIP_VAR_t, newobj::_SCIP_Real) = @scip_ccall_check("SCIPchgVarObjDive",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newobj
)
_SCIPchgVarLbDive(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarLbDive",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newbound
)
_SCIPchgVarUbDive(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarUbDive",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newbound
)
_SCIPaddRowDive(scip::SCIP_t, row::SCIP_ROW_t) = @scip_ccall_check("SCIPaddRowDive",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}), 
	pointer(scip), pointer(row)
)
_SCIPchgRowLhsDive(scip::SCIP_t, row::SCIP_ROW_t, newlhs::_SCIP_Real) = @scip_ccall_check("SCIPchgRowLhsDive",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, _SCIP_Real), 
	pointer(scip), pointer(row), newlhs
)
_SCIPchgRowRhsDive(scip::SCIP_t, row::SCIP_ROW_t, newrhs::_SCIP_Real) = @scip_ccall_check("SCIPchgRowRhsDive",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, _SCIP_Real), 
	pointer(scip), pointer(row), newrhs
)
_SCIPsolveDiveLP(scip::SCIP_t, itlim::Int, lperror::SCIP_Bool_t, cutoff::SCIP_Bool_t) = @scip_ccall_check("SCIPsolveDiveLP",
	(Ptr{_SCIP}, Int, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), itlim, pointer(lperror), pointer(cutoff)
)
_SCIPstartProbing(scip::SCIP_t) = @scip_ccall_check("SCIPstartProbing",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPnewProbingNode(scip::SCIP_t) = @scip_ccall_check("SCIPnewProbingNode",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPbacktrackProbing(scip::SCIP_t, probingdepth::Int) = @scip_ccall_check("SCIPbacktrackProbing",
	(Ptr{_SCIP}, Int), 
	pointer(scip), probingdepth
)
_SCIPendProbing(scip::SCIP_t) = @scip_ccall_check("SCIPendProbing",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPchgVarLbProbing(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarLbProbing",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newbound
)
_SCIPchgVarUbProbing(scip::SCIP_t, var::SCIP_VAR_t, newbound::_SCIP_Real) = @scip_ccall_check("SCIPchgVarUbProbing",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), newbound
)
_SCIPfixVarProbing(scip::SCIP_t, var::SCIP_VAR_t, fixedval::_SCIP_Real) = @scip_ccall_check("SCIPfixVarProbing",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(var), fixedval
)
_SCIPpropagateProbing(scip::SCIP_t, maxproprounds::Int, cutoff::SCIP_Bool_t, ndomredsfound::Int64) = @scip_ccall_check("SCIPpropagateProbing",
	(Ptr{_SCIP}, Int, Ptr{_SCIP_Bool}, Ptr{Int64}), 
	pointer(scip), maxproprounds, pointer(cutoff), pointer(ndomredsfound)
)
_SCIPpropagateProbingImplications(scip::SCIP_t, cutoff::SCIP_Bool_t) = @scip_ccall_check("SCIPpropagateProbingImplications",
	(Ptr{_SCIP}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(cutoff)
)
_SCIPsolveProbingLP(scip::SCIP_t, itlim::Int, lperror::SCIP_Bool_t, cutoff::SCIP_Bool_t) = @scip_ccall_check("SCIPsolveProbingLP",
	(Ptr{_SCIP}, Int, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), itlim, pointer(lperror), pointer(cutoff)
)
_SCIPsolveProbingLPWithPricing(scip::SCIP_t, pretendroot::_SCIP_Bool, displayinfo::_SCIP_Bool, maxpricerounds::Int, lperror::SCIP_Bool_t, cutoff::SCIP_Bool_t) = @scip_ccall_check("SCIPsolveProbingLPWithPricing",
	(Ptr{_SCIP}, _SCIP_Bool, _SCIP_Bool, Int, Ptr{_SCIP_Bool}, Ptr{_SCIP_Bool}), 
	pointer(scip), pretendroot, displayinfo, maxpricerounds, pointer(lperror), pointer(cutoff)
)
_SCIPaddExternBranchCand(scip::SCIP_t, var::SCIP_VAR_t, score::_SCIP_Real, solval::_SCIP_Real) = @scip_ccall_check("SCIPaddExternBranchCand",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), pointer(var), score, solval
)
_SCIPcreateChild(scip::SCIP_t, node::SCIP_NODE_t, nodeselprio::_SCIP_Real, estimate::_SCIP_Real) = @scip_ccall_check("SCIPcreateChild",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_NODE}}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(node), nodeselprio, estimate
)
_SCIPbranchVar(scip::SCIP_t, var::SCIP_VAR_t, downchild::SCIP_NODE_t, eqchild::SCIP_NODE_t, upchild::SCIP_NODE_t) = @scip_ccall_check("SCIPbranchVar",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, Ptr{Ptr{_SCIP_NODE}}, Ptr{Ptr{_SCIP_NODE}}, Ptr{Ptr{_SCIP_NODE}}), 
	pointer(scip), pointer(var), array(downchild), array(eqchild), array(upchild)
)
_SCIPbranchVarHole(scip::SCIP_t, var::SCIP_VAR_t, left::_SCIP_Real, right::_SCIP_Real, downchild::SCIP_NODE_t, upchild::SCIP_NODE_t) = @scip_ccall_check("SCIPbranchVarHole",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, Ptr{Ptr{_SCIP_NODE}}, Ptr{Ptr{_SCIP_NODE}}), 
	pointer(scip), pointer(var), left, right, array(downchild), array(upchild)
)
_SCIPbranchVarVal(scip::SCIP_t, var::SCIP_VAR_t, val::_SCIP_Real, downchild::SCIP_NODE_t, eqchild::SCIP_NODE_t, upchild::SCIP_NODE_t) = @scip_ccall_check("SCIPbranchVarVal",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_Real, Ptr{Ptr{_SCIP_NODE}}, Ptr{Ptr{_SCIP_NODE}}, Ptr{Ptr{_SCIP_NODE}}), 
	pointer(scip), pointer(var), val, array(downchild), array(eqchild), array(upchild)
)
_SCIPbranchLP(scip::SCIP_t, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPbranchLP",
	(Ptr{_SCIP}, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(result)
)
_SCIPbranchExtern(scip::SCIP_t, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPbranchExtern",
	(Ptr{_SCIP}, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(result)
)
_SCIPbranchPseudo(scip::SCIP_t, result::SCIP_RESULT_t) = @scip_ccall_check("SCIPbranchPseudo",
	(Ptr{_SCIP}, Ptr{_SCIP_RESULT}), 
	pointer(scip), pointer(result)
)
_SCIPcreateSol(scip::SCIP_t, sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall_check("SCIPcreateSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_HEUR}), 
	pointer(scip), array(sol), pointer(heur)
)
_SCIPcreateLPSol(scip::SCIP_t, sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall_check("SCIPcreateLPSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_HEUR}), 
	pointer(scip), array(sol), pointer(heur)
)
_SCIPcreateNLPSol(scip::SCIP_t, sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall_check("SCIPcreateNLPSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_HEUR}), 
	pointer(scip), array(sol), pointer(heur)
)
_SCIPcreateRelaxSol(scip::SCIP_t, sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall_check("SCIPcreateRelaxSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_HEUR}), 
	pointer(scip), array(sol), pointer(heur)
)
_SCIPcreatePseudoSol(scip::SCIP_t, sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall_check("SCIPcreatePseudoSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_HEUR}), 
	pointer(scip), array(sol), pointer(heur)
)
_SCIPcreateCurrentSol(scip::SCIP_t, sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall_check("SCIPcreateCurrentSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_HEUR}), 
	pointer(scip), array(sol), pointer(heur)
)
_SCIPcreateUnknownSol(scip::SCIP_t, sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall_check("SCIPcreateUnknownSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_HEUR}), 
	pointer(scip), array(sol), pointer(heur)
)
_SCIPcreateOrigSol(scip::SCIP_t, sol::SCIP_SOL_t, heur::SCIP_HEUR_t) = @scip_ccall_check("SCIPcreateOrigSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_HEUR}), 
	pointer(scip), array(sol), pointer(heur)
)
_SCIPcreateSolCopy(scip::SCIP_t, sol::SCIP_SOL_t, sourcesol::SCIP_SOL_t) = @scip_ccall_check("SCIPcreateSolCopy",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_SOL}), 
	pointer(scip), array(sol), pointer(sourcesol)
)
_SCIPcreateFiniteSolCopy(scip::SCIP_t, sol::SCIP_SOL_t, sourcesol::SCIP_SOL_t, success::SCIP_Bool_t) = @scip_ccall_check("SCIPcreateFiniteSolCopy",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Bool}), 
	pointer(scip), array(sol), pointer(sourcesol), pointer(success)
)
_SCIPfreeSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPfreeSol",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}), 
	pointer(scip), array(sol)
)
_SCIPlinkLPSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPlinkLPSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPlinkNLPSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPlinkNLPSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPlinkRelaxSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPlinkRelaxSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPlinkPseudoSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPlinkPseudoSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPlinkCurrentSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPlinkCurrentSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPclearSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPclearSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPunlinkSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPunlinkSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPsetSolVal(scip::SCIP_t, sol::SCIP_SOL_t, var::SCIP_VAR_t, val::_SCIP_Real) = @scip_ccall_check("SCIPsetSolVal",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(sol), pointer(var), val
)
_SCIPsetSolVals(scip::SCIP_t, sol::SCIP_SOL_t, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t) = @scip_ccall_check("SCIPsetSolVals",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(sol), nvars, array(vars), pointer(vals)
)
_SCIPincSolVal(scip::SCIP_t, sol::SCIP_SOL_t, var::SCIP_VAR_t, incval::_SCIP_Real) = @scip_ccall_check("SCIPincSolVal",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(sol), pointer(var), incval
)
_SCIPgetSolVals(scip::SCIP_t, sol::SCIP_SOL_t, nvars::Int, vars::SCIP_VAR_t, vals::SCIP_Real_t) = @scip_ccall_check("SCIPgetSolVals",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(sol), nvars, array(vars), pointer(vals)
)
_SCIPadjustImplicitSolVals(scip::SCIP_t, sol::SCIP_SOL_t, uselprows::_SCIP_Bool) = @scip_ccall_check("SCIPadjustImplicitSolVals",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, _SCIP_Bool), 
	pointer(scip), pointer(sol), uselprows
)
_SCIProundSol(scip::SCIP_t, sol::SCIP_SOL_t, success::SCIP_Bool_t) = @scip_ccall_check("SCIProundSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(sol), pointer(success)
)
_SCIPretransformSol(scip::SCIP_t, sol::SCIP_SOL_t) = @scip_ccall_check("SCIPretransformSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}), 
	pointer(scip), pointer(sol)
)
_SCIPreadSol(scip::SCIP_t, filename::String) = @scip_ccall_check("SCIPreadSol",
	(Ptr{_SCIP}, String), 
	pointer(scip), filename
)
_SCIPaddSol(scip::SCIP_t, sol::SCIP_SOL_t, stored::SCIP_Bool_t) = @scip_ccall_check("SCIPaddSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(sol), pointer(stored)
)
_SCIPaddSolFree(scip::SCIP_t, sol::SCIP_SOL_t, stored::SCIP_Bool_t) = @scip_ccall_check("SCIPaddSolFree",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, Ptr{_SCIP_Bool}), 
	pointer(scip), array(sol), pointer(stored)
)
_SCIPaddCurrentSol(scip::SCIP_t, heur::SCIP_HEUR_t, stored::SCIP_Bool_t) = @scip_ccall_check("SCIPaddCurrentSol",
	(Ptr{_SCIP}, Ptr{_SCIP_HEUR}, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(heur), pointer(stored)
)
_SCIPtrySol(scip::SCIP_t, sol::SCIP_SOL_t, printreason::_SCIP_Bool, checkbounds::_SCIP_Bool, checkintegrality::_SCIP_Bool, checklprows::_SCIP_Bool, stored::SCIP_Bool_t) = @scip_ccall_check("SCIPtrySol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(sol), printreason, checkbounds, checkintegrality, checklprows, pointer(stored)
)
_SCIPtrySolFree(scip::SCIP_t, sol::SCIP_SOL_t, printreason::_SCIP_Bool, checkbounds::_SCIP_Bool, checkintegrality::_SCIP_Bool, checklprows::_SCIP_Bool, stored::SCIP_Bool_t) = @scip_ccall_check("SCIPtrySolFree",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_SOL}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(scip), array(sol), printreason, checkbounds, checkintegrality, checklprows, pointer(stored)
)
_SCIPtryCurrentSol(scip::SCIP_t, heur::SCIP_HEUR_t, printreason::_SCIP_Bool, checkintegrality::_SCIP_Bool, checklprows::_SCIP_Bool, stored::SCIP_Bool_t) = @scip_ccall_check("SCIPtryCurrentSol",
	(Ptr{_SCIP}, Ptr{_SCIP_HEUR}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(heur), printreason, checkintegrality, checklprows, pointer(stored)
)
_SCIPcheckSol(scip::SCIP_t, sol::SCIP_SOL_t, printreason::_SCIP_Bool, checkbounds::_SCIP_Bool, checkintegrality::_SCIP_Bool, checklprows::_SCIP_Bool, feasible::SCIP_Bool_t) = @scip_ccall_check("SCIPcheckSol",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, Ptr{_SCIP_Bool}), 
	pointer(scip), pointer(sol), printreason, checkbounds, checkintegrality, checklprows, pointer(feasible)
)
_SCIPcheckSolOrig(scip::SCIP_t, sol::SCIP_SOL_t, feasible::SCIP_Bool_t, printreason::_SCIP_Bool, completely::_SCIP_Bool) = @scip_ccall_check("SCIPcheckSolOrig",
	(Ptr{_SCIP}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Bool}, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), pointer(sol), pointer(feasible), printreason, completely
)
_SCIPdropEvent(scip::SCIP_t, eventtype::_SCIP_EVENTTYPE, eventhdlr::SCIP_EVENTHDLR_t, eventdata::SCIP_EVENTDATA_t, filterpos::Int) = @scip_ccall_check("SCIPdropEvent",
	(Ptr{_SCIP}, _SCIP_EVENTTYPE, Ptr{_SCIP_EVENTHDLR}, Ptr{_SCIP_EVENTDATA}, Int), 
	pointer(scip), eventtype, pointer(eventhdlr), pointer(eventdata), filterpos
)
_SCIPdropVarEvent(scip::SCIP_t, var::SCIP_VAR_t, eventtype::_SCIP_EVENTTYPE, eventhdlr::SCIP_EVENTHDLR_t, eventdata::SCIP_EVENTDATA_t, filterpos::Int) = @scip_ccall_check("SCIPdropVarEvent",
	(Ptr{_SCIP}, Ptr{_SCIP_VAR}, _SCIP_EVENTTYPE, Ptr{_SCIP_EVENTHDLR}, Ptr{_SCIP_EVENTDATA}, Int), 
	pointer(scip), pointer(var), eventtype, pointer(eventhdlr), pointer(eventdata), filterpos
)
_SCIPdropRowEvent(scip::SCIP_t, row::SCIP_ROW_t, eventtype::_SCIP_EVENTTYPE, eventhdlr::SCIP_EVENTHDLR_t, eventdata::SCIP_EVENTDATA_t, filterpos::Int) = @scip_ccall_check("SCIPdropRowEvent",
	(Ptr{_SCIP}, Ptr{_SCIP_ROW}, _SCIP_EVENTTYPE, Ptr{_SCIP_EVENTHDLR}, Ptr{_SCIP_EVENTDATA}, Int), 
	pointer(scip), pointer(row), eventtype, pointer(eventhdlr), pointer(eventdata), filterpos
)
_SCIPcutoffNode(scip::SCIP_t, node::SCIP_NODE_t) = @scip_ccall_check("SCIPcutoffNode",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}), 
	pointer(scip), pointer(node)
)
_SCIPrepropagateNode(scip::SCIP_t, node::SCIP_NODE_t) = @scip_ccall_check("SCIPrepropagateNode",
	(Ptr{_SCIP}, Ptr{_SCIP_NODE}), 
	pointer(scip), pointer(node)
)
_SCIPupdateCutoffbound(scip::SCIP_t, cutoffbound::_SCIP_Real) = @scip_ccall_check("SCIPupdateCutoffbound",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), cutoffbound
)
_SCIPwriteImplicationConflictGraph(scip::SCIP_t, filename::String) = @scip_ccall_check("SCIPwriteImplicationConflictGraph",
	(Ptr{_SCIP}, String), 
	pointer(scip), filename
)
_SCIPcreateClock(scip::SCIP_t, clck::SCIP_CLOCK_t) = @scip_ccall_check("SCIPcreateClock",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CLOCK}}), 
	pointer(scip), array(clck)
)
_SCIPcreateCPUClock(scip::SCIP_t, clck::SCIP_CLOCK_t) = @scip_ccall_check("SCIPcreateCPUClock",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CLOCK}}), 
	pointer(scip), array(clck)
)
_SCIPcreateWallClock(scip::SCIP_t, clck::SCIP_CLOCK_t) = @scip_ccall_check("SCIPcreateWallClock",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CLOCK}}), 
	pointer(scip), array(clck)
)
_SCIPfreeClock(scip::SCIP_t, clck::SCIP_CLOCK_t) = @scip_ccall_check("SCIPfreeClock",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CLOCK}}), 
	pointer(scip), array(clck)
)
_SCIPresetClock(scip::SCIP_t, clck::SCIP_CLOCK_t) = @scip_ccall_check("SCIPresetClock",
	(Ptr{_SCIP}, Ptr{_SCIP_CLOCK}), 
	pointer(scip), pointer(clck)
)
_SCIPstartClock(scip::SCIP_t, clck::SCIP_CLOCK_t) = @scip_ccall_check("SCIPstartClock",
	(Ptr{_SCIP}, Ptr{_SCIP_CLOCK}), 
	pointer(scip), pointer(clck)
)
_SCIPstopClock(scip::SCIP_t, clck::SCIP_CLOCK_t) = @scip_ccall_check("SCIPstopClock",
	(Ptr{_SCIP}, Ptr{_SCIP_CLOCK}), 
	pointer(scip), pointer(clck)
)
_SCIPstartSolvingTime(scip::SCIP_t) = @scip_ccall_check("SCIPstartSolvingTime",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPstopSolvingTime(scip::SCIP_t) = @scip_ccall_check("SCIPstopSolvingTime",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsetClockTime(scip::SCIP_t, clck::SCIP_CLOCK_t, sec::_SCIP_Real) = @scip_ccall_check("SCIPsetClockTime",
	(Ptr{_SCIP}, Ptr{_SCIP_CLOCK}, _SCIP_Real), 
	pointer(scip), pointer(clck), sec
)
_SCIPchgFeastol(scip::SCIP_t, feastol::_SCIP_Real) = @scip_ccall_check("SCIPchgFeastol",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), feastol
)
_SCIPchgLpfeastol(scip::SCIP_t, lpfeastol::_SCIP_Real, printnewvalue::_SCIP_Bool) = @scip_ccall_check("SCIPchgLpfeastol",
	(Ptr{_SCIP}, _SCIP_Real, _SCIP_Bool), 
	pointer(scip), lpfeastol, printnewvalue
)
_SCIPchgDualfeastol(scip::SCIP_t, dualfeastol::_SCIP_Real) = @scip_ccall_check("SCIPchgDualfeastol",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), dualfeastol
)
_SCIPchgBarrierconvtol(scip::SCIP_t, barrierconvtol::_SCIP_Real) = @scip_ccall_check("SCIPchgBarrierconvtol",
	(Ptr{_SCIP}, _SCIP_Real), 
	pointer(scip), barrierconvtol
)
_SCIPcreateRealarray(scip::SCIP_t, realarray::SCIP_REALARRAY_t) = @scip_ccall_check("SCIPcreateRealarray",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_REALARRAY}}), 
	pointer(scip), array(realarray)
)
_SCIPfreeRealarray(scip::SCIP_t, realarray::SCIP_REALARRAY_t) = @scip_ccall_check("SCIPfreeRealarray",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_REALARRAY}}), 
	pointer(scip), array(realarray)
)
_SCIPextendRealarray(scip::SCIP_t, realarray::SCIP_REALARRAY_t, minidx::Int, maxidx::Int) = @scip_ccall_check("SCIPextendRealarray",
	(Ptr{_SCIP}, Ptr{_SCIP_REALARRAY}, Int, Int), 
	pointer(scip), pointer(realarray), minidx, maxidx
)
_SCIPclearRealarray(scip::SCIP_t, realarray::SCIP_REALARRAY_t) = @scip_ccall_check("SCIPclearRealarray",
	(Ptr{_SCIP}, Ptr{_SCIP_REALARRAY}), 
	pointer(scip), pointer(realarray)
)
_SCIPsetRealarrayVal(scip::SCIP_t, realarray::SCIP_REALARRAY_t, idx::Int, val::_SCIP_Real) = @scip_ccall_check("SCIPsetRealarrayVal",
	(Ptr{_SCIP}, Ptr{_SCIP_REALARRAY}, Int, _SCIP_Real), 
	pointer(scip), pointer(realarray), idx, val
)
_SCIPincRealarrayVal(scip::SCIP_t, realarray::SCIP_REALARRAY_t, idx::Int, incval::_SCIP_Real) = @scip_ccall_check("SCIPincRealarrayVal",
	(Ptr{_SCIP}, Ptr{_SCIP_REALARRAY}, Int, _SCIP_Real), 
	pointer(scip), pointer(realarray), idx, incval
)
_SCIPcreateIntarray(scip::SCIP_t, intarray::SCIP_INTARRAY_t) = @scip_ccall_check("SCIPcreateIntarray",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_INTARRAY}}), 
	pointer(scip), array(intarray)
)
_SCIPfreeIntarray(scip::SCIP_t, intarray::SCIP_INTARRAY_t) = @scip_ccall_check("SCIPfreeIntarray",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_INTARRAY}}), 
	pointer(scip), array(intarray)
)
_SCIPextendIntarray(scip::SCIP_t, intarray::SCIP_INTARRAY_t, minidx::Int, maxidx::Int) = @scip_ccall_check("SCIPextendIntarray",
	(Ptr{_SCIP}, Ptr{_SCIP_INTARRAY}, Int, Int), 
	pointer(scip), pointer(intarray), minidx, maxidx
)
_SCIPclearIntarray(scip::SCIP_t, intarray::SCIP_INTARRAY_t) = @scip_ccall_check("SCIPclearIntarray",
	(Ptr{_SCIP}, Ptr{_SCIP_INTARRAY}), 
	pointer(scip), pointer(intarray)
)
_SCIPsetIntarrayVal(scip::SCIP_t, intarray::SCIP_INTARRAY_t, idx::Int, val::Int) = @scip_ccall_check("SCIPsetIntarrayVal",
	(Ptr{_SCIP}, Ptr{_SCIP_INTARRAY}, Int, Int), 
	pointer(scip), pointer(intarray), idx, val
)
_SCIPincIntarrayVal(scip::SCIP_t, intarray::SCIP_INTARRAY_t, idx::Int, incval::Int) = @scip_ccall_check("SCIPincIntarrayVal",
	(Ptr{_SCIP}, Ptr{_SCIP_INTARRAY}, Int, Int), 
	pointer(scip), pointer(intarray), idx, incval
)
_SCIPcreateBoolarray(scip::SCIP_t, boolarray::SCIP_BOOLARRAY_t) = @scip_ccall_check("SCIPcreateBoolarray",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_BOOLARRAY}}), 
	pointer(scip), array(boolarray)
)
_SCIPfreeBoolarray(scip::SCIP_t, boolarray::SCIP_BOOLARRAY_t) = @scip_ccall_check("SCIPfreeBoolarray",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_BOOLARRAY}}), 
	pointer(scip), array(boolarray)
)
_SCIPextendBoolarray(scip::SCIP_t, boolarray::SCIP_BOOLARRAY_t, minidx::Int, maxidx::Int) = @scip_ccall_check("SCIPextendBoolarray",
	(Ptr{_SCIP}, Ptr{_SCIP_BOOLARRAY}, Int, Int), 
	pointer(scip), pointer(boolarray), minidx, maxidx
)
_SCIPclearBoolarray(scip::SCIP_t, boolarray::SCIP_BOOLARRAY_t) = @scip_ccall_check("SCIPclearBoolarray",
	(Ptr{_SCIP}, Ptr{_SCIP_BOOLARRAY}), 
	pointer(scip), pointer(boolarray)
)
_SCIPsetBoolarrayVal(scip::SCIP_t, boolarray::SCIP_BOOLARRAY_t, idx::Int, val::_SCIP_Bool) = @scip_ccall_check("SCIPsetBoolarrayVal",
	(Ptr{_SCIP}, Ptr{_SCIP_BOOLARRAY}, Int, _SCIP_Bool), 
	pointer(scip), pointer(boolarray), idx, val
)
_SCIPcreatePtrarray(scip::SCIP_t, ptrarray::SCIP_PTRARRAY_t) = @scip_ccall_check("SCIPcreatePtrarray",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_PTRARRAY}}), 
	pointer(scip), array(ptrarray)
)
_SCIPfreePtrarray(scip::SCIP_t, ptrarray::SCIP_PTRARRAY_t) = @scip_ccall_check("SCIPfreePtrarray",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_PTRARRAY}}), 
	pointer(scip), array(ptrarray)
)
_SCIPextendPtrarray(scip::SCIP_t, ptrarray::SCIP_PTRARRAY_t, minidx::Int, maxidx::Int) = @scip_ccall_check("SCIPextendPtrarray",
	(Ptr{_SCIP}, Ptr{_SCIP_PTRARRAY}, Int, Int), 
	pointer(scip), pointer(ptrarray), minidx, maxidx
)
_SCIPclearPtrarray(scip::SCIP_t, ptrarray::SCIP_PTRARRAY_t) = @scip_ccall_check("SCIPclearPtrarray",
	(Ptr{_SCIP}, Ptr{_SCIP_PTRARRAY}), 
	pointer(scip), pointer(ptrarray)
)
_SCIPincludeConshdlrCountsols(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrCountsols",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcount(scip::SCIP_t) = @scip_ccall_check("SCIPcount",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsetParamsCountsols(scip::SCIP_t) = @scip_ccall_check("SCIPsetParamsCountsols",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPincludeConshdlrLogicor(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrLogicor",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsLogicor(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsLogicor",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicLogicor(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPcreateConsBasicLogicor",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), array(cons), name, nvars, array(vars)
)
_SCIPaddCoefLogicor(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPaddCoefLogicor",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(cons), pointer(var)
)
_SCIPincludeConshdlrNonlinear(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrNonlinear",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, nexprtrees::Int, exprtrees::SCIP_EXPRTREE_t, nonlincoefs::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsNonlinear",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Int, Ptr{Ptr{_SCIP_EXPRTREE}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nlinvars, array(linvars), pointer(lincoefs), nexprtrees, array(exprtrees), pointer(nonlincoefs), lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, nexprtrees::Int, exprtrees::SCIP_EXPRTREE_t, nonlincoefs::SCIP_Real_t, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicNonlinear",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Int, Ptr{Ptr{_SCIP_EXPRTREE}}, Ptr{_SCIP_Real}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, nlinvars, array(linvars), pointer(lincoefs), nexprtrees, array(exprtrees), pointer(nonlincoefs), lhs, rhs
)
_SCIPcreateConsNonlinear2(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, exprgraphnode::SCIP_EXPRGRAPHNODE_t, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsNonlinear2",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_EXPRGRAPHNODE}, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nlinvars, array(linvars), pointer(lincoefs), pointer(exprgraphnode), lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicNonlinear2(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nlinvars::Int, linvars::SCIP_VAR_t, lincoefs::SCIP_Real_t, exprgraphnode::SCIP_EXPRGRAPHNODE_t, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicNonlinear2",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_EXPRGRAPHNODE}, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, nlinvars, array(linvars), pointer(lincoefs), pointer(exprgraphnode), lhs, rhs
)
_SCIPaddLinearVarNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t, coef::_SCIP_Real) = @scip_ccall_check("SCIPaddLinearVarNonlinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}, _SCIP_Real), 
	pointer(scip), pointer(cons), pointer(var), coef
)
_SCIPsetExprtreesNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, nexprtrees::Int, exprtrees::SCIP_EXPRTREE_t, coefs::SCIP_Real_t) = @scip_ccall_check("SCIPsetExprtreesNonlinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Int, Ptr{Ptr{_SCIP_EXPRTREE}}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(cons), nexprtrees, array(exprtrees), pointer(coefs)
)
_SCIPaddExprtreesNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, nexprtrees::Int, exprtrees::SCIP_EXPRTREE_t, coefs::SCIP_Real_t) = @scip_ccall_check("SCIPaddExprtreesNonlinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Int, Ptr{Ptr{_SCIP_EXPRTREE}}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(cons), nexprtrees, array(exprtrees), pointer(coefs)
)
_SCIPgetNlRowNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPgetNlRowNonlinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_NLROW}}), 
	pointer(scip), pointer(cons), array(nlrow)
)
_SCIPcheckCurvatureNonlinear(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPcheckCurvatureNonlinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)
_SCIPgetCurvatureNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, checkcurv::_SCIP_Bool, curvature::SCIP_EXPRCURV_t) = @scip_ccall_check("SCIPgetCurvatureNonlinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool, Ptr{_SCIP_EXPRCURV}), 
	pointer(scip), pointer(cons), checkcurv, pointer(curvature)
)
_SCIPgetExprtreeCurvaturesNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, checkcurv::_SCIP_Bool, curvatures::SCIP_EXPRCURV_t) = @scip_ccall_check("SCIPgetExprtreeCurvaturesNonlinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, _SCIP_Bool, Ptr{Ptr{_SCIP_EXPRCURV}}), 
	pointer(scip), pointer(cons), checkcurv, array(curvatures)
)
_SCIPgetViolationNonlinear(scip::SCIP_t, cons::SCIP_CONS_t, sol::SCIP_SOL_t, violation::SCIP_Real_t) = @scip_ccall_check("SCIPgetViolationNonlinear",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_SOL}, Ptr{_SCIP_Real}), 
	pointer(scip), pointer(cons), pointer(sol), pointer(violation)
)
_SCIPincludeConshdlrSetppc(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrSetppc",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsSetpart(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsSetpart",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicSetpart(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPcreateConsBasicSetpart",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), array(cons), name, nvars, array(vars)
)
_SCIPcreateConsSetpack(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsSetpack",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicSetpack(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPcreateConsBasicSetpack",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), array(cons), name, nvars, array(vars)
)
_SCIPcreateConsSetcover(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsSetcover",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, nvars, array(vars), initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicSetcover(scip::SCIP_t, cons::SCIP_CONS_t, name::String, nvars::Int, vars::SCIP_VAR_t) = @scip_ccall_check("SCIPcreateConsBasicSetcover",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Int, Ptr{Ptr{_SCIP_VAR}}), 
	pointer(scip), array(cons), name, nvars, array(vars)
)
_SCIPaddCoefSetppc(scip::SCIP_t, cons::SCIP_CONS_t, var::SCIP_VAR_t) = @scip_ccall_check("SCIPaddCoefSetppc",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{_SCIP_VAR}), 
	pointer(scip), pointer(cons), pointer(var)
)
_SCIPdialoghdlrAddInputLine(dialoghdlr::SCIP_DIALOGHDLR_t, inputline::String) = @scip_ccall_check("SCIPdialoghdlrAddInputLine",
	(Ptr{_SCIP_DIALOGHDLR}, String), 
	pointer(dialoghdlr), inputline
)
_SCIPdialoghdlrAddHistory(dialoghdlr::SCIP_DIALOGHDLR_t, dialog::SCIP_DIALOG_t, command::String, escapecommand::_SCIP_Bool) = @scip_ccall_check("SCIPdialoghdlrAddHistory",
	(Ptr{_SCIP_DIALOGHDLR}, Ptr{_SCIP_DIALOG}, String, _SCIP_Bool), 
	pointer(dialoghdlr), pointer(dialog), command, escapecommand
)
_SCIPdialogDisplayMenu(dialog::SCIP_DIALOG_t, scip::SCIP_t) = @scip_ccall_check("SCIPdialogDisplayMenu",
	(Ptr{_SCIP_DIALOG}, Ptr{_SCIP}), 
	pointer(dialog), pointer(scip)
)
_SCIPdialogDisplayMenuEntry(dialog::SCIP_DIALOG_t, scip::SCIP_t) = @scip_ccall_check("SCIPdialogDisplayMenuEntry",
	(Ptr{_SCIP_DIALOG}, Ptr{_SCIP}), 
	pointer(dialog), pointer(scip)
)
_SCIPdialogDisplayCompletions(dialog::SCIP_DIALOG_t, scip::SCIP_t, entryname::String) = @scip_ccall_check("SCIPdialogDisplayCompletions",
	(Ptr{_SCIP_DIALOG}, Ptr{_SCIP}, String), 
	pointer(dialog), pointer(scip), entryname
)
_SCIPvarsGetProbvarBinary(vars::SCIP_VAR_t, negatedarr::SCIP_Bool_t, nvars::Int) = @scip_ccall_check("SCIPvarsGetProbvarBinary",
	(Ptr{Ptr{Ptr{_SCIP_VAR}}}, Ptr{Ptr{_SCIP_Bool}}, Int), 
	array(vars), array(negatedarr), nvars
)
_SCIPvarGetProbvarBinary(var::SCIP_VAR_t, negated::SCIP_Bool_t) = @scip_ccall_check("SCIPvarGetProbvarBinary",
	(Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Bool}), 
	array(var), pointer(negated)
)
_SCIPvarGetProbvarBound(var::SCIP_VAR_t, bound::SCIP_Real_t, boundtype::SCIP_BOUNDTYPE_t) = @scip_ccall_check("SCIPvarGetProbvarBound",
	(Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_BOUNDTYPE}), 
	array(var), pointer(bound), pointer(boundtype)
)
_SCIPvarGetProbvarHole(var::SCIP_VAR_t, left::SCIP_Real_t, right::SCIP_Real_t) = @scip_ccall_check("SCIPvarGetProbvarHole",
	(Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	array(var), pointer(left), pointer(right)
)
_SCIPvarGetOrigvarSum(var::SCIP_VAR_t, scalar::SCIP_Real_t, constant::SCIP_Real_t) = @scip_ccall_check("SCIPvarGetOrigvarSum",
	(Ptr{Ptr{_SCIP_VAR}}, Ptr{_SCIP_Real}, Ptr{_SCIP_Real}), 
	array(var), pointer(scalar), pointer(constant)
)
_SCIPvarGetAggregatedObj(var::SCIP_VAR_t, aggrobj::SCIP_Real_t) = @scip_ccall_check("SCIPvarGetAggregatedObj",
	(Ptr{_SCIP_VAR}, Ptr{_SCIP_Real}), 
	pointer(var), pointer(aggrobj)
)
_SCIPvarSetInitial(var::SCIP_VAR_t, initial::_SCIP_Bool) = @scip_ccall_check("SCIPvarSetInitial",
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), initial
)
_SCIPvarSetRemovable(var::SCIP_VAR_t, removable::_SCIP_Bool) = @scip_ccall_check("SCIPvarSetRemovable",
	(Ptr{_SCIP_VAR}, _SCIP_Bool), 
	pointer(var), removable
)
_SCIPincludeConshdlrBivariate(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrBivariate",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsBivariate(scip::SCIP_t, cons::SCIP_CONS_t, name::String, f::SCIP_EXPRTREE_t, convextype::_SCIP_BIVAR_CONVEXITY, z::SCIP_VAR_t, zcoef::_SCIP_Real, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsBivariate",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_EXPRTREE}, _SCIP_BIVAR_CONVEXITY, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(f), convextype, pointer(z), zcoef, lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicBivariate(scip::SCIP_t, cons::SCIP_CONS_t, name::String, f::SCIP_EXPRTREE_t, convextype::_SCIP_BIVAR_CONVEXITY, z::SCIP_VAR_t, zcoef::_SCIP_Real, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicBivariate",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_EXPRTREE}, _SCIP_BIVAR_CONVEXITY, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, pointer(f), convextype, pointer(z), zcoef, lhs, rhs
)
_SCIPincludeConshdlrAbspower(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrAbspower",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPcreateConsAbspower(scip::SCIP_t, cons::SCIP_CONS_t, name::String, x::SCIP_VAR_t, z::SCIP_VAR_t, exponent::_SCIP_Real, xoffset::_SCIP_Real, zcoef::_SCIP_Real, lhs::_SCIP_Real, rhs::_SCIP_Real, initial::_SCIP_Bool, separate::_SCIP_Bool, enforce::_SCIP_Bool, check::_SCIP_Bool, propagate::_SCIP_Bool, localVar::_SCIP_Bool, modifiable::_SCIP_Bool, dynamic::_SCIP_Bool, removable::_SCIP_Bool, stickingatnode::_SCIP_Bool) = @scip_ccall_check("SCIPcreateConsAbspower",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool, _SCIP_Bool), 
	pointer(scip), array(cons), name, pointer(x), pointer(z), exponent, xoffset, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, localVar, modifiable, dynamic, removable, stickingatnode
)
_SCIPcreateConsBasicAbspower(scip::SCIP_t, cons::SCIP_CONS_t, name::String, x::SCIP_VAR_t, z::SCIP_VAR_t, exponent::_SCIP_Real, xoffset::_SCIP_Real, zcoef::_SCIP_Real, lhs::_SCIP_Real, rhs::_SCIP_Real) = @scip_ccall_check("SCIPcreateConsBasicAbspower",
	(Ptr{_SCIP}, Ptr{Ptr{_SCIP_CONS}}, String, Ptr{_SCIP_VAR}, Ptr{_SCIP_VAR}, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real, _SCIP_Real), 
	pointer(scip), array(cons), name, pointer(x), pointer(z), exponent, xoffset, zcoef, lhs, rhs
)
_SCIPgetNlRowAbspower(scip::SCIP_t, cons::SCIP_CONS_t, nlrow::SCIP_NLROW_t) = @scip_ccall_check("SCIPgetNlRowAbspower",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Ptr{Ptr{_SCIP_NLROW}}), 
	pointer(scip), pointer(cons), array(nlrow)
)
_SCIPincludeDefaultPlugins(scip::SCIP_t) = @scip_ccall_check("SCIPincludeDefaultPlugins",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPincludeConshdlrCumulative(scip::SCIP_t) = @scip_ccall_check("SCIPincludeConshdlrCumulative",
	(Ptr{_SCIP},), 
	pointer(scip)
)
_SCIPsetHminCumulative(scip::SCIP_t, cons::SCIP_CONS_t, hmin::Int) = @scip_ccall_check("SCIPsetHminCumulative",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Int), 
	pointer(scip), pointer(cons), hmin
)
_SCIPsetHmaxCumulative(scip::SCIP_t, cons::SCIP_CONS_t, hmax::Int) = @scip_ccall_check("SCIPsetHmaxCumulative",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}, Int), 
	pointer(scip), pointer(cons), hmax
)
_SCIPvisualizeConsCumulative(scip::SCIP_t, cons::SCIP_CONS_t) = @scip_ccall_check("SCIPvisualizeConsCumulative",
	(Ptr{_SCIP}, Ptr{_SCIP_CONS}), 
	pointer(scip), pointer(cons)
)