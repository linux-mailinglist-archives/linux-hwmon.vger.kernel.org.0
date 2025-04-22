Return-Path: <linux-hwmon+bounces-7871-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3CA965EF
	for <lists+linux-hwmon@lfdr.de>; Tue, 22 Apr 2025 12:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E16F57A276A
	for <lists+linux-hwmon@lfdr.de>; Tue, 22 Apr 2025 10:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B59E1F4C8F;
	Tue, 22 Apr 2025 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="QKymG9BT"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A506F1D799D
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Apr 2025 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317751; cv=none; b=Aq58M7VOn6peBv90pIvkLVJFbXhNOBnV7lhdM4UFc42bPzTFnQE+miArft4gwZUF5/XnT04yM6unKZpq1iC5kXSRjzYFxbYmayl9kMAQwUtV4rBF1pN49s9EKJdU9ZVKfKKUrMpcW7BIMdd/OtihL4vKfSdfBNK9hcUbtEsqorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317751; c=relaxed/simple;
	bh=OtKUFMsCCXQuyXdiECTB3D04cRKpceApukek+qlG2Xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l0Cy2ukTBjk9dE8auNMqkx+gnYu9a0UCyy8OVug7dK/xWGCmjgujdzYE6Ir8JtFGPG4F5TwE2EmvntiMB9c87MuZUXRneF9WpuQ83IRtN4nHQ51iE87N6Le+DhxC4/0LOtWavzXHAgHZhVIjZb7TexKKq7Pv8l6dRv2OymGWvoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=QKymG9BT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c277331eso5157868b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Apr 2025 03:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1745317746; x=1745922546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wtwwt/qGVMfOAJ61/DZj57iTfzywR/wMkolYpyXZwMg=;
        b=QKymG9BTaQM/G9cl6fJZmX1DLUhOVviZlTuu7TEKn/JLEzF1C1oBOCeG7qYH7i9fmv
         CX1ciJbvdYkLqUj2qDmGnQjr/NjYTseiG3TQs9jDGD1q75jhbpXyx+IVe9hLIyKAJuPN
         2Wmrxxc+WlY4HnZnm3acXCvQpv+RaD8MA9EbNzCN0tDgwmdZa+b260/7OkQGncMoh8Jg
         diTGNiXX/w5uoOpGcerSSWr49haDExVjHl4FRYMKUc6ZXU8WMHjnuGMPxFEUJCJcTPq5
         N2tAJjHRQg1uuUoaPIapfIOu4YcmWjvHdyCZIFwGMwu68SfMqasogjvnZPE6J5s3Nh1E
         yjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317746; x=1745922546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wtwwt/qGVMfOAJ61/DZj57iTfzywR/wMkolYpyXZwMg=;
        b=EITczmWiSCWRkqE5PGp7x0e9ZQCYU77f7LDcgWapI+qSwTRpIJPUKuuDDWRCrH0EbU
         oOrV6IUXbN2Ij60nhpYo9AMckN/Y+dwsTI2W4UnrC7Moozyv9fq+JOwwZWOETdo3xBTN
         EXizTddtehS0642ndvSNuv017ZsrzumV8NX6hYehzDbN/EuFL0+/NOmYboRueNPEVk+k
         kPYVa41sfmR6xJO1rTLyd+bdsCIRb2OXbbCjMDo16C6K/pY7qbRjcGKT8q/GngoJKd1Y
         Lh/k6/L2lGaBV/tO2IXDe9ziw2EAqtXzkH5QXnL8POo9gxXCp3fEz+cAc830haq/EAgI
         BlxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwRvykpg+dApQ1pzl2CJ8OhmZca+pLQ0ncVnaFwT9njgPW+7S3EXBUUI3H4ArH/llefp9jokMbzm3IUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtch8vIZVu2REJghuu8RmdM4tbk7Y2WXBd3PgNpD8P+XxO7SvH
	7N+Lgizy3fATlLVHOPrUQURV0GXepSBjM4CdL3CdaIbUe6Q4YMeSfmADD0etehg=
X-Gm-Gg: ASbGncswY/VU0XguVxeywFrHf/T8UeWRqUC6SzHZhmGrb6xPVq2aQJC1BHq+qlICYyn
	RsWDR+WvLN3HSX0FjFrTlaBOTRDxi4vJBHOdJFpwZ46KAFf0hFnOSyqSsTtwdkc4pqqTBlTEyjl
	jB7I+q3+XFNd9zySi6RuR9wBh3BZhOcO96Jxiria4ntbjYxuajX0XJl15N1mj3pljUXxOAwbTqJ
	ztZPdQw9amfbCZGewwABFp+nrt9w0voyaaCRWvo9f0JYxaph8GkDc5lbDwbToHF4r+ZfTfarJhf
	dBKa5r3GEr8yzH3ihQ5Y1n06PfSorGxEIIdWQpxJasj3dyh5EOaONG+x+NLy86yd2ABbq10deUW
	TChHKsPhAFX8KbqYpY8/ST36LySrNBP3NTobSRCX6X5bY5ie6psa0o/XbP6Y=
X-Google-Smtp-Source: AGHT+IGWvQiFpLLb/JnK+vxMBI1uFfmAhPCio9warje9sSHRSfH/F8j7WFctbSygpqJcvFqmOTJrmg==
X-Received: by 2002:a05:6a21:3a83:b0:1e1:9e9f:ae4 with SMTP id adf61e73a8af0-203cc6e03e3mr20985847637.13.1745317745940;
        Tue, 22 Apr 2025 03:29:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c1c40sm5541763a12.33.2025.04.22.03.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:29:05 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
X-Google-Original-From: Chiang Brian <chiang.brian@inventec.corp-partner.google.com>
To: linux@roeck-us.net
Cc: chiang.brian@inventec.com,
	gnoack@google.com,
	gpiccoli@igalia.com,
	jdelvare@suse.com,
	kees@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	mic@digikod.net,
	tony.luck@intel.com
Subject: Re: [PATCH v5] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 22 Apr 2025 18:20:57 +0800
Message-Id: <20250422102057.2846899-1-chiang.brian@inventec.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2628dd1f-1b8f-478a-aa89-4c0f78b27962@roeck-us.net>
References: <2628dd1f-1b8f-478a-aa89-4c0f78b27962@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 3/14/25 10:44, Guenter Roeck wrote:
> On 3/13/25 20:30, Chiang Brian wrote:
> > The TPS53685 is a fully AMD SVI3 compliant step down
> > controller with trans-inductor voltage regulator
> > (TLVR) topology support, dual channels, built-in
> > non-volatile memory (NVM), PMBus interface, and
> > full compatible with TI NexFET smart power
> > stages.
> > Add support for it to the tps53679 driver.
> > 
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > ---
> > v4 -> V5:
> >      1. document the compatible of tps53685 into dt-bindings
> > 	2. add the buffer length as argument for %*ph
> > 	3. Add Changelog
> > v3 -> V4:
> >      1. Add length comparison into the comparison of "id",or it may be true when
> > 	   the substring of "id" matches device id.
> > 	2. Restore `return 0;` in `tps53679_identify_chip()`
> > V2 -> V3:
> >      1. Remove the length comparsion in the comparison of "id".
> > V1 -> V2:
> > 	1. Modify subject and description to meet requirements
> > 	2. Add "tps53685" into enum chips with numeric order
> > 	3. Modify the content of marco "TPS53681_DEVICE_ID" from 0x81 to "\x81"
> > 	   Add marco "TPS53685_DEVICE_ID" with content "TIShP"
> > 	4. Modify the type of "id" from u16 to char* in `tps53679_identify_chip()`
> > 	5. Modify the comparison of "id". It will be true if the string "id" matches
> > 	   device ID and compare with type char*,
> > 	6. Add the length comparsion into the comparison of "id".
> > 	7. Modify "len" as return code in `tps53679_identify_chip()`
> > 	8. Output device error log with %*ph, instead of 0x%x\n"
> >      9. Use existing tps53679_identify_multiphase() with argument
> > 	   "TPS53685_DEVICE_ID" in tps53685_identify() rather than creating one
> > 	   tps53685_identify_multiphase()
> > 
> > boot-log:
> 
> This is completely useless noise.

Sorry for the delay, I've got the approval for posting the boot-log from our 
customer. I was afraid that there's any confidential information in the boot-log
of our project. So, I decided to post a boot-log with my laptop then, and I'll 
append a new one once new patch has been finished and uploaded. 

And thanks for the suggestion of adding a buffer length for %*ph.
The kernel crashes and keeps rebooting without adding that.

In addition, should I in-reply-to the existing thread or create a new one 
since the dt-bindings should be included in the same thread as well?

Thank you.

Best Regards,
Brian Chiang

