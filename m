Return-Path: <linux-hwmon+bounces-453-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19780E385
	for <lists+linux-hwmon@lfdr.de>; Tue, 12 Dec 2023 06:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 511A11C214C4
	for <lists+linux-hwmon@lfdr.de>; Tue, 12 Dec 2023 05:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E3CF9DF;
	Tue, 12 Dec 2023 05:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVVI70Eo"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1ABBF;
	Mon, 11 Dec 2023 21:09:19 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7b6f2dd5633so323860939f.2;
        Mon, 11 Dec 2023 21:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702357758; x=1702962558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9G38MnYxloPLTIZ+OetQ1mORKFpiowG0dMHn9jL5d7Y=;
        b=BVVI70EocFk/Nto5gC2zA+NTuZKnFJ83M6JfguJfFq5O6BzAeSCpFYiOZe7nTrjf3h
         77BpBJdupAS253qGBVfRZ1Wxz/yiPRrnlsymKQWe6JnnKbts4zngikGv2lc3usYRwrXw
         3vWhUXuVwzDAOLfQxsBd2Lzovdq7mXm1LXoxShxYRC8BLKVIefxj+vscNnC5Kjlqc60Z
         zwgx3wUFG1AHNhzf7gSlnGAzKW+hC72/VQex26oVvJmyalutAiDkuZvW6q8fGxs+FqZE
         7wtjytGiZTFXWQwbg1+aRtAZ0rqySu8ln7BV0x3wpoICGT1eCRmu2KKxFHO63nizI4sG
         acYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702357758; x=1702962558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G38MnYxloPLTIZ+OetQ1mORKFpiowG0dMHn9jL5d7Y=;
        b=LeBB5THjIgbalh+xJydiy+0Jj0iwMLDEjenFSrRYfR2+Q6echegF6rDNL2J3BRvH4y
         tPXCtcZE4g+6VCefn2JjX31ccm9TuP9d+/CKtHnIxqx9ssOUrCXhkRGVZD3eR+CHhEXN
         LhrlhmI4sNdSZEfJFSV/IMdBS2MldveUDcNbxjdJ8R70dZi5fS9NqHfIlvhZKYiM7snF
         Q1ScT2fmtalCUibuqAnpqt1Ym4bJjbqB18lYpROgkqTG9YorulYdGJoyZvf20oUGNiTw
         vyv31JipG3yRGohW/4ZoEGnsOcA13qqBWNnsyKf4jCRJ6HwmxQ+E71hyrF/27ok/0Iw/
         qYAg==
X-Gm-Message-State: AOJu0Ywo8H5UnOSVx9MfrNqiniqGlbpVC4857WTsRf015Sy/nWuOJnfI
	vsN4dEKbQ7vR9b/oAY9je+4=
X-Google-Smtp-Source: AGHT+IEXLTMAR8yoR+tMUOcvaWMCmDMJWvbVwLEPR1/YKZgRhFI0CkInsXMHnxwuruCFVjtNQf1D4A==
X-Received: by 2002:a05:6e02:2142:b0:35d:7b57:2294 with SMTP id d2-20020a056e02214200b0035d7b572294mr9341168ilv.32.1702357758245;
        Mon, 11 Dec 2023 21:09:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001b9e9edbf43sm7582929plk.171.2023.12.11.21.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:09:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 21:09:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: clemens@ladisch.de, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (k10temp) Add support for AMD Family 19h Model
 8h
Message-ID: <274237cb-ac4d-430f-8d41-98b2bdb2eb1b@roeck-us.net>
References: <20231211210206.11060-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211210206.11060-1-W_Armin@gmx.de>

On Mon, Dec 11, 2023 at 10:02:06PM +0100, Armin Wolf wrote:
> From: Jami Kurki <bindkeys@gmail.com>
> 
> Add support for AMD Family 19h Model 8h CPUs, which appear to
> be the Zen 3 based AMD Threadripper 5000WX series (Chagall).
> 
> The patch was tested with an AMD Threadripper 5955WX.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218244
> Tested-by: Jami Kurki <bindkeys@gmail.com>
> Signed-off-by: Jami Kurki <bindkeys@gmail.com>
> Co-developed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter

> ---
> Changes since v1:
> - reword patch description
> - reduce changes to existing code
> ---
>  drivers/hwmon/k10temp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> --
> 2.39.2
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index bae0becfa24b..8092312c0a87 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -455,6 +455,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> 
>  		switch (boot_cpu_data.x86_model) {
>  		case 0x0 ... 0x1:	/* Zen3 SP3/TR */
> +		case 0x8:		/* Zen3 TR Chagall */
>  		case 0x21:		/* Zen3 Ryzen Desktop */
>  		case 0x50 ... 0x5f:	/* Green Sardine */
>  			data->ccd_offset = 0x154;

