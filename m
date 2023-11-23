Return-Path: <linux-hwmon+bounces-187-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C34C7F6306
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Nov 2023 16:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8885B210BF
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Nov 2023 15:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440883A28E;
	Thu, 23 Nov 2023 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hqrjk+ji"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DA010C8;
	Thu, 23 Nov 2023 07:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700753434; x=1732289434;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wf42AL/tv0Fj/STvDq+UcPvgDOY05tysJaWbd/9145E=;
  b=Hqrjk+jiyfN8HamNPWp0k6xmrsveyLqNEM3lm/RDkms2oFbzQa5atP/D
   z94HbW6A+kVl93JOuL9o44bYWQhy6bFi6ypQCBpB59Q6DZwRdOexDmOdF
   bV2nIdbwGB57uCdAOh6EBJ9X/Xwv5Hkp5pi28F+QJjfaZXFJsG8UxfOxx
   adkHPmRfeak1Dj0bsccl7oMOevf6Vz2FrzeR0yLdJJEfwQAXm9MDEz6KY
   paJC6LZIh7hnRF/3lQo94M7IyTJLMh+FJwVA/DdmZJP+dzfNDnsPdi0pd
   EzXhi6BSjPbRVgHyyiPG7cnvuGq86FVYAZimpX4cm9JTlsXkMDdpfm7GL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5431839"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="5431839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 07:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="15698967"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 07:30:26 -0800
Date: Thu, 23 Nov 2023 17:30:23 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: SungHwan Jung <onenowy@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, "Lee, Chun-Yi" <jlee@suse.com>, 
    Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] platform/x86: acer-wmi: add fan speed monitoring
 for Predator PHN16-71
In-Reply-To: <20231123152229.4920-3-onenowy@gmail.com>
Message-ID: <b01745a3-8097-4a67-e7bb-559990db2cb7@linux.intel.com>
References: <20231123152229.4920-1-onenowy@gmail.com> <20231123152229.4920-3-onenowy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, SungHwan Jung wrote:

> Support CPU and GPU fan speed monitoring through WMI for Predator
> PHN16-71.
> 
> This patch depends on patch "platform/x86: acer-wmi: Add platform
> profile and mode key support for Predator PHN16-71"
> 
> "select ACPI_VIDEO" cause recursive dependency and it is not recommended
> to use "select" for visible symbol, "select" has changed to "depends on".
> 
> Signed-off-by: SungHwan Jung <onenowy@gmail.com>
> ---
>  drivers/platform/x86/Kconfig    |  3 +-
>  drivers/platform/x86/acer-wmi.c | 98 ++++++++++++++++++++++++++++++++-
>  2 files changed, 99 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7e69fdacc..33ddb644e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -177,7 +177,8 @@ config ACER_WMI
>  	depends on INPUT
>  	depends on RFKILL || RFKILL = n
>  	depends on ACPI_WMI
> -	select ACPI_VIDEO
> +	depends on HWMON
> +	depends on ACPI_VIDEO
>  	select INPUT_SPARSEKMAP
>  	select LEDS_CLASS
>  	select NEW_LEDS
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index e3650dce0..f2f3b1c45 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
>  static const struct key_entry acer_wmi_keymap[] __initconst = {
> @@ -241,6 +244,7 @@ struct hotkey_function_type_aa {
>  #define ACER_CAP_TURBO_LED     BIT(8)
>  #define ACER_CAP_TURBO_FAN     BIT(9)
>  #define ACER_CAP_PLATFORM_PROFILE BIT(10)
> +#define ACER_CAP_FAN_SPEED_READ BIT(11)

It would be nice to align these with tabs.

> @@ -1722,6 +1727,25 @@ static int acer_gsensor_event(void)
>  	return 0;
>  }
>  
> +static int acer_get_fan_speed(int fan)
> +{
> +	if (quirks->predator_v4) {
> +		acpi_status status;
> +		u64 fanspeed;
> +
> +		status = WMI_gaming_execute_u64(
> +			ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
> +			fan == 0 ? ACER_WMID_CMD_GET_PREDATOR_V4_CPU_FAN_SPEED :
> +				   ACER_WMID_CMD_GET_PREDATOR_V4_GPU_FAN_SPEED,
> +			&fanspeed);
> +
> +		if (ACPI_FAILURE(status))
> +			return -EIO;
> +		return fanspeed >> 8;

Define a named field using GENMASK() and use FIELD_GET() ?


-- 
 i.


