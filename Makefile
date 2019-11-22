#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=UnixBench-openwrt
PKG_VERSION:=5.1.3
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=eSir Playground

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/description
UnixBench is a simple synthetic benchmarking application whick was first started in 1983 at Monash University.
It was then taken and expanded by Byte Magazine. The tests compare Unix systems by comparing their results
to a set of scores set by running the code on a benchmark system, which is a SPARCstation 20-61 (rated at 10.0)
endef

define Package/$(PKG_NAME)
	CATEGORY:=eSir Playground
	SUBMENU:=1. Performance
	TITLE:= A Benchmarking Application
	URL:=https://github.com/esirplayground/UnixBench-openwrt
	DEPENDS:=@TARGET_x86_64 +perl +perlbase-posix +perlbase-time +perlbase-io +perlbase-findbin \
			+coreutils-od +make +gcc

endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/$(PKG_NAME)
	$(CP) ./UnixBench/* $(PKG_BUILD_DIR)/$(PKG_NAME)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/$(PKG_NAME)
	cp -pR $(PKG_BUILD_DIR)/$(PKG_NAME)/* $(1)/usr/bin/$(PKG_NAME)
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
