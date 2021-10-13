Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A2F42C5C3
	for <lists+linux-hwmon@lfdr.de>; Wed, 13 Oct 2021 18:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbhJMQGR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 13 Oct 2021 12:06:17 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:55576 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhJMQGR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Oct 2021 12:06:17 -0400
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 3.0.0)
 id 5610ad909f428166; Wed, 13 Oct 2021 18:04:11 +0200
Received: from kreacher.localnet (unknown [213.134.161.244])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id E1E2166A871;
        Wed, 13 Oct 2021 18:04:10 +0200 (CEST)
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux ACPI <linux-acpi@vger.kernel.org>
Cc:     linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] hwmon: acpi_power_meter: Use acpi_bus_get_acpi_device()
Date:   Wed, 13 Oct 2021 18:04:09 +0200
Message-ID: <11871063.O9o76ZdvQC@kreacher>
In-Reply-To: <11864888.O9o76ZdvQC@kreacher>
References: <11864888.O9o76ZdvQC@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.161.244
X-CLIENT-HOSTNAME: 213.134.161.244
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpedvjeelgffhiedukedtleekkedvudfggefhgfegjefgueekjeelvefggfdvledutdenucfkphepvddufedrudefgedrudeiuddrvdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvudefrddufeegrdduiedurddvgeegpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhrtghpthhtoheplhhinhhugidqrggtphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuggvlhhvrghrvgesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggt
 khdquhhsrdhnvghtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomh
X-DCC--Metrics: v370.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

In read_domain_devices(), acpi_bus_get_device() is called to obtain
the ACPI device object attached to the given ACPI handle and
subsequently that object is passed to get_device() for reference
counting, but there is a window between the acpi_bus_get_device()
and get_device() calls in which the ACPI device object in question
may go away.

To address this issue, make read_domain_devices() use
acpi_bus_get_acpi_device() to reference count and return the given
ACPI device object in one go and export that function to modules.

While at it, also make read_domain_devices() and
remove_domain_devices() use acpi_dev_put() instead of calling
put_device() directly on the ACPI device objects returned by
acpi_bus_get_acpi_device().

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

-> v2: Resend with a different From and S-o-b address and with R-by
       from Andy.  No other changes.

---
 drivers/acpi/scan.c              |    1 +
 drivers/hwmon/acpi_power_meter.c |   13 +++++--------
 2 files changed, 6 insertions(+), 8 deletions(-)

Index: linux-pm/drivers/hwmon/acpi_power_meter.c
===================================================================
--- linux-pm.orig/drivers/hwmon/acpi_power_meter.c
+++ linux-pm/drivers/hwmon/acpi_power_meter.c
@@ -535,7 +535,7 @@ static void remove_domain_devices(struct
 
 		sysfs_remove_link(resource->holders_dir,
 				  kobject_name(&obj->dev.kobj));
-		put_device(&obj->dev);
+		acpi_dev_put(obj);
 	}
 
 	kfree(resource->domain_devices);
@@ -597,18 +597,15 @@ static int read_domain_devices(struct ac
 			continue;
 
 		/* Create a symlink to domain objects */
-		resource->domain_devices[i] = NULL;
-		if (acpi_bus_get_device(element->reference.handle,
-					&resource->domain_devices[i]))
+		obj = acpi_bus_get_acpi_device(element->reference.handle);
+		resource->domain_devices[i] = obj;
+		if (!obj)
 			continue;
 
-		obj = resource->domain_devices[i];
-		get_device(&obj->dev);
-
 		res = sysfs_create_link(resource->holders_dir, &obj->dev.kobj,
 				      kobject_name(&obj->dev.kobj));
 		if (res) {
-			put_device(&obj->dev);
+			acpi_dev_put(obj);
 			resource->domain_devices[i] = NULL;
 		}
 	}
Index: linux-pm/drivers/acpi/scan.c
===================================================================
--- linux-pm.orig/drivers/acpi/scan.c
+++ linux-pm/drivers/acpi/scan.c
@@ -608,6 +608,7 @@ struct acpi_device *acpi_bus_get_acpi_de
 {
 	return handle_to_device(handle, get_acpi_device);
 }
+EXPORT_SYMBOL_GPL(acpi_bus_get_acpi_device);
 
 static struct acpi_device_bus_id *acpi_device_bus_id_match(const char *dev_id)
 {



