Return-Path: <linux-hwmon+bounces-12933-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOgGC9aNy2kuIwYAu9opvQ
	(envelope-from <linux-hwmon+bounces-12933-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 31 Mar 2026 11:03:18 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7BC366A45
	for <lists+linux-hwmon@lfdr.de>; Tue, 31 Mar 2026 11:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 070DB30626CC
	for <lists+linux-hwmon@lfdr.de>; Tue, 31 Mar 2026 09:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151183EBF23;
	Tue, 31 Mar 2026 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZQjtz/r"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9963B3E557F;
	Tue, 31 Mar 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947621; cv=none; b=s5Wq5XuIEDz1fj8PPGY4hFrIcgHsp4q3d8MuqDb0K32Kt7c6e7XKJQnAEhqnZzUtmxIhOTP8cG4fWsgSBNAsyewT0oVC3YkDASOFUyG5fCIZo/awy6lSK/ghv/HPeZ7Jl6Nfc7RQ92V3xti666j1jmrWKSnJltiKvctD7nRmI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947621; c=relaxed/simple;
	bh=bsUk8lXey/MgHEGQWHr65TC97aJRgQM4peIDf0AU2N8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MG3ELdjCVnMKUe8mdiP9wq1VMT2EtqkvWy/p6FAgBJTLQCGjXcQgoK7ozC+fsFaj39wmjPU3U3YZDb2pGuEpY85QUu/dIA4mlOfg9ExBBSiQ6lRRHH0ZwXsKcpCOijbMJHXoqHlZEZPnk+hH2DWeyJtTJTBx7JsNapiObVKbDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZQjtz/r; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774947619; x=1806483619;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bsUk8lXey/MgHEGQWHr65TC97aJRgQM4peIDf0AU2N8=;
  b=FZQjtz/rji/pS0I/SQw9Dh3d1v5lcJZRIWczHARuFYYeYrF0QY8mVnQR
   qbzI9RKEcNebCb3wP0rWHRZ8ul148F/w+eOCeQQmH8x7xiHRNF+jbYdQt
   p9ThwrNxh822RzcaobLQBt1479UIpIA9BYkAj9TLNEgBaGkGDFb/4AQUY
   sWMaA0oMk2KsbdYrcHdX39TWgWSamhHlPA57uP+sgH0iLj2A2kbfi6IqC
   98UofRpGlofuJNFK/J130QaSZsd6zwJY3VWsWWUMAczPwjPQzxS2vv46p
   J1/fJG/03gMYLJ7WXRiyCWZXege5LXkA/ZaQPkPqRR0riCL1PVsj947TA
   g==;
X-CSE-ConnectionGUID: TKu4u1PsT5avZrFsfc6tJg==
X-CSE-MsgGUID: gj/E4tT7SHKFiNxbvWpV+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86570072"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86570072"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:00:19 -0700
X-CSE-ConnectionGUID: EPLvlXv8TOi1Io6ktCvWTQ==
X-CSE-MsgGUID: liLe0mJdRyunrx+/YtWGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="225301263"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:00:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 12:00:11 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v3 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
In-Reply-To: <20260314175249.16040-2-W_Armin@gmx.de>
Message-ID: <0020b3ec-e095-3736-413e-84f08dbcff93@linux.intel.com>
References: <20260314175249.16040-1-W_Armin@gmx.de> <20260314175249.16040-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12933-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gmx.de:email,buffer.data:url]
X-Rspamd-Queue-Id: 7B7BC366A45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026, Armin Wolf wrote:

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the descriptor.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../platform/x86/dell/dell-wmi-descriptor.c   | 94 +++++++++----------
>  1 file changed, 47 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> index c2a180202719..fe42eb8bbd79 100644
> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> @@ -7,7 +7,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/acpi.h>
> +#include <linux/compiler_attributes.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/wmi.h>
> @@ -15,6 +15,24 @@
>  
>  #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
>  
> +/*
> + * Descriptor buffer is 128 byte long and contains:
> + *
> + *       Name             Offset  Length  Value
> + * Vendor Signature          0       4    "DELL"
> + * Object Signature          4       4    " WMI"
> + * WMI Interface Version     8       4    <version>
> + * WMI buffer length        12       4    <length>
> + * WMI hotfix number        16       4    <hotfix>
> + */
> +struct descriptor {
> +	char vendor_signature[4];
> +	char object_signature[4];
> +	__le32 interface_version;
> +	__le32 buffer_length;
> +	__le32 hotfix_number;
> +} __packed;
> +
>  struct descriptor_priv {
>  	struct list_head list;
>  	u32 interface_version;
> @@ -88,76 +106,58 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
>  }
>  EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
>  
> -/*
> - * Descriptor buffer is 128 byte long and contains:
> - *
> - *       Name             Offset  Length  Value
> - * Vendor Signature          0       4    "DELL"
> - * Object Signature          4       4    " WMI"
> - * WMI Interface Version     8       4    <version>
> - * WMI buffer length        12       4    <length>
> - * WMI hotfix number        16       4    <hotfix>
> - */
> -static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
> -				     const void *context)
> +static int dell_wmi_descriptor_probe(struct wmi_device *wdev, const void *context)
>  {
> -	union acpi_object *obj = NULL;
>  	struct descriptor_priv *priv;
> -	u32 *buffer;
> +	struct wmi_buffer buffer;
> +	struct descriptor *desc;
>  	int ret;
>  
> -	obj = wmidev_block_query(wdev, 0);
> -	if (!obj) {
> -		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
> -		ret = -EIO;
> -		goto out;
> -	}
> +	ret = wmidev_query_block(wdev, 0, &buffer);
> +	if (ret < 0)
> +		return ret;
>  
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> -		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
> +	if (buffer.length < sizeof(*desc)) {
> +		dev_err(&wdev->dev,
> +			"Dell descriptor buffer contains not enough data (%zu)\n",

This word order sounds odd to me. I'd say:

Dell descriptor buffer does not contain ...

> +			buffer.length);
>  		ret = -EINVAL;
>  		descriptor_valid = ret;
>  		goto out;
>  	}
>  
> -	/* Although it's not technically a failure, this would lead to
> -	 * unexpected behavior
> -	 */
> -	if (obj->buffer.length != 128) {
> -		dev_err(&wdev->dev,
> -			"Dell descriptor buffer has unexpected length (%d)\n",
> -			obj->buffer.length);
> -		ret = -EINVAL;
> +	desc = buffer.data;

I think these should be moving towards using __free() so we could remove 
those gotos to kfree(). This applies to many changes in this series. Some 
may need a local variable to be introduced (here we've 'desc' already so 
it's very easy in this case).

I'm fine if you want to do __free() changes in a patch separate from 
this wmi conversion but we should aim to make these follow best practices 
so that others pick the preferred patterns more easily.

> +	if (strncmp(desc->vendor_signature, "DELL", sizeof(desc->vendor_signature))) {
> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signature (%4ph)\n",
> +			desc->vendor_signature);
> +		ret = -ENOMSG;
>  		descriptor_valid = ret;
>  		goto out;
>  	}
>  
> -	buffer = (u32 *)obj->buffer.pointer;
> -
> -	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
> -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
> -			buffer);
> -		ret = -EINVAL;
> +	if (strncmp(desc->object_signature, " WMI", sizeof(desc->vendor_signature))) {
> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signature (%4ph)\n",
> +			desc->object_signature);
> +		ret = -ENOMSG;
>  		descriptor_valid = ret;
>  		goto out;
>  	}
>  	descriptor_valid = 0;
>  
> -	if (buffer[2] != 0 && buffer[2] != 1)
> -		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
> -			(unsigned long) buffer[2]);
> -
> -	priv = devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
> -	GFP_KERNEL);
> +	if (le32_to_cpu(desc->interface_version) > 2)
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
> +			 le32_to_cpu(desc->interface_version));
>  
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv) {
>  		ret = -ENOMEM;
>  		goto out;
>  	}
>  
> -	priv->interface_version = buffer[2];
> -	priv->size = buffer[3];
> -	priv->hotfix = buffer[4];
> +	priv->interface_version = le32_to_cpu(desc->interface_version);
> +	priv->size = le32_to_cpu(desc->buffer_length);
> +	priv->hotfix = le32_to_cpu(desc->hotfix_number);
>  	ret = 0;
>  	dev_set_drvdata(&wdev->dev, priv);
>  	mutex_lock(&list_mutex);
> @@ -170,7 +170,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>  		(unsigned long) priv->hotfix);
>  
>  out:
> -	kfree(obj);
> +	kfree(buffer.data);
>  	return ret;
>  }
>  
> 

-- 
 i.


