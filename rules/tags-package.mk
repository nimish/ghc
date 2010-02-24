# -----------------------------------------------------------------------------
#
# (c) 2009 The University of Glasgow
#
# This file is part of the GHC build system.
#
# To understand how the build system works and how to modify it, see
#      http://hackage.haskell.org/trac/ghc/wiki/Building/Architecture
#      http://hackage.haskell.org/trac/ghc/wiki/Building/Modifying
#
# -----------------------------------------------------------------------------


# Build the tags files for a package. Use like this:
#
# $(eval $(call tags-package,compiler,stage2))
#
# Uses the same metadata as build-package.

define tags-package
# $1 = dir
# $2 = distdir

.PHONY: tags_$1
tags_$1:
	inplace/bin/ghctags --topdir $$(TOP)/inplace/lib -b --use-cabal-config $1/$2 -- $$($1_$2_TAGS_HC_OPTS) $$($1_$2_v_ALL_HC_OPTS) -- $$($1_$2_HS_SRCS)

endef
