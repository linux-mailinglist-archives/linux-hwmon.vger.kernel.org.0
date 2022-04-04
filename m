Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E5A4F1A56
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Apr 2022 23:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378898AbiDDVSV (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 4 Apr 2022 17:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380040AbiDDSpp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Apr 2022 14:45:45 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEEFAE6C;
        Mon,  4 Apr 2022 11:43:49 -0700 (PDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id D1D2B22246;
        Mon,  4 Apr 2022 20:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1649097827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ATzKng0Bo6d19J8plCRK65PNpfkaclCPCJA7+STwAtE=;
        b=YcB+7nYNg5LEAv8sXheBqu6L7iD3m8TrMhLYmt8B2rO1PI1+EQmvvuL4u8mXBpptKvTqzr
        h3h1V8bG2JpBEopdv76Q0ZuTymd88RR3eXuQn1vgBsNn6EfriXHYUCLUrgKF4l+ZYBAc7X
        SC2yh4Az2Rg14RFwarsbOmPrwbY2WYo=
From:   Michael Walle <michael@walle.cc>
To:     Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, David Laight <David.Laight@ACULAB.COM>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v3 1/2] hwmon: introduce hwmon_sanitize_name()
Date:   Mon,  4 Apr 2022 20:43:39 +0200
Message-Id: <20220404184340.3973329-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404184340.3973329-1-michael@walle.cc>
References: <20220404184340.3973329-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

More and more drivers will check for bad characters in the hwmon name
and all are using the same code snippet. Consolidate that code by adding
a new hwmon_sanitize_name() function.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 Documentation/hwmon/hwmon-kernel-api.rst | 16 ++++++++
 drivers/hwmon/hwmon.c                    | 50 ++++++++++++++++++++++++
 include/linux/hwmon.h                    |  3 ++
 3 files changed, 69 insertions(+)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index c41eb6108103..e2975d5caf34 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -50,6 +50,10 @@ register/unregister functions::
 
   void devm_hwmon_device_unregister(struct device *dev);
 
+  char *hwmon_sanitize_name(const char *name);
+
+  char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
+
 hwmon_device_register_with_groups registers a hardware monitoring device.
 The first parameter of this function is a pointer to the parent device.
 The name parameter is a pointer to the hwmon device name. The registration
@@ -95,6 +99,18 @@ All supported hwmon device registration functions only accept valid device
 names. Device names including invalid characters (whitespace, '*', or '-')
 will be rejected. The 'name' parameter is mandatory.
 
+If the driver doesn't use a static device name (for example it uses
+dev_name()), and therefore cannot make sure the name only contains valid
+characters, hwmon_sanitize_name can be used. This convenience function
+will duplicate the string and replace any invalid characters with an
+underscore. It will allocate memory for the new string and it is the
+responsibility of the caller to release the memory when the device is
+removed.
+
+devm_hwmon_sanitize_name is the resource managed version of
+hwmon_sanitize_name; the memory will be freed automatically on device
+removal.
+
 Using devm_hwmon_device_register_with_info()
 --------------------------------------------
 
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 989e2c8496dd..cc4a16a466a0 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -1057,6 +1057,56 @@ void devm_hwmon_device_unregister(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_hwmon_device_unregister);
 
+static char *__hwmon_sanitize_name(struct device *dev, const char *old_name)
+{
+	char *name, *p;
+
+	if (dev)
+		name = devm_kstrdup(dev, old_name, GFP_KERNEL);
+	else
+		name = kstrdup(old_name, GFP_KERNEL);
+	if (!name)
+		return NULL;
+
+	for (p = name; *p; p++)
+		if (hwmon_is_bad_char(*p))
+			*p = '_';
+
+	return name;
+}
+
+/**
+ * hwmon_sanitize_name - Replaces invalid characters in a hwmon name
+ * @name: NUL-terminated name
+ *
+ * Allocates a new string where any invalid characters will be replaced
+ * by an underscore. It is the responsibility of the caller to release
+ * the memory.
+ *
+ * Returns newly allocated name or %NULL in case of error.
+ */
+char *hwmon_sanitize_name(const char *name)
+{
+	return __hwmon_sanitize_name(NULL, name);
+}
+EXPORT_SYMBOL_GPL(hwmon_sanitize_name);
+
+/**
+ * devm_hwmon_sanitize_name - resource managed hwmon_sanitize_name()
+ * @dev: device to allocate memory for
+ * @name: NUL-terminated name
+ *
+ * Allocates a new string where any invalid characters will be replaced
+ * by an underscore.
+ *
+ * Returns newly allocated name or %NULL in case of error.
+ */
+char *devm_hwmon_sanitize_name(struct device *dev, const char *name)
+{
+	return __hwmon_sanitize_name(dev, name);
+}
+EXPORT_SYMBOL_GPL(devm_hwmon_sanitize_name);
+
 static void __init hwmon_pci_quirks(void)
 {
 #if defined CONFIG_X86 && defined CONFIG_PCI
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index eba380b76d15..4efaf06fd2b8 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -461,6 +461,9 @@ void devm_hwmon_device_unregister(struct device *dev);
 int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel);
 
+char *hwmon_sanitize_name(const char *name);
+char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
+
 /**
  * hwmon_is_bad_char - Is the char invalid in a hwmon name
  * @ch: the char to be considered
-- 
2.30.2

