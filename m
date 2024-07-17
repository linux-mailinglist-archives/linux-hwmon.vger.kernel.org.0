Return-Path: <linux-hwmon+bounces-3146-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7013933DB1
	for <lists+linux-hwmon@lfdr.de>; Wed, 17 Jul 2024 15:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8DD1F21002
	for <lists+linux-hwmon@lfdr.de>; Wed, 17 Jul 2024 13:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0496317F4F2;
	Wed, 17 Jul 2024 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geSYJWkq"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5539566A
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223306; cv=none; b=SHDlHnoWLvkGLLXGeNZwhfsQ/8Vhk9m051P84Xz8Wp+KUXmEnNzlw4E3P6QkDc3OGi4bNpZDWXSj1fvwoo3ZgMFYhfLJUJba671atUXMq4Lw2v4XiRiHm1wFzOSmxi1Lm43sEaGu4BljuwoFyvPvx0FbN280DbGXoATHAhcqr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223306; c=relaxed/simple;
	bh=73loJkdt+Vxy+jjMDn7UzsYUwcX0irFaRThHP5SltDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8rAJn3Rc1I3C/bevU2CR1L8wQ5JLHS+29SmtTCnKwWtXS+p5Ns6S3mcOiIfCwKH+iZxp7qPfSIIJTg38QuLPIbohwL9I4B2cmC99Ehjx5Ee96v5c+49AX5uSkHwv0eQq8rw0TS0AZa3Mp0DOdroDP8eHgDBC2MwCd1ZYqa2RW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geSYJWkq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBF0C4AF0D;
	Wed, 17 Jul 2024 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223306;
	bh=73loJkdt+Vxy+jjMDn7UzsYUwcX0irFaRThHP5SltDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geSYJWkq/jGF4/WTd9GCoPFNZbBspHTwILxVnrjUVg7G8l2QB82XxfJYhfVdxK7HV
	 3OAz+tza5NZPu5TfyDwgoCs9F1S6SeVUSBnkL+r50zJuV2NXxi007jaDAyVuApJxsR
	 lY2WhD2YikT7nO6rLaYN4GgxnHfL3mxosacHxzWvuZ87sjU90zFViZYosUCnFVo/90
	 7RlGkZ8DNLSLbQh0fbIcHV4Yb4D76Eo4Neso6v+XJnYH606PlfPvju8TO/JYSglwGk
	 lIOfYNKhPf9slhwgJv4oxy4qk7Y7KdBMlXoKNNCrpxww1hHDcl/IoXQEI9BdAUfNEJ
	 c33jfU4gSlQaA==
Date: Wed, 17 Jul 2024 21:35:03 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/6] hwmon: (nct7802) Use multi-byte regmap operations
Message-ID: <ZpfIh2XxU-PzKEPR@tzungbi-laptop>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716230050.2049534-3-linux@roeck-us.net>

On Tue, Jul 16, 2024 at 04:00:46PM -0700, Guenter Roeck wrote:
> Use multi-byte regmap operations where possible to reduce code size
> and the need for mutex protection.
> 
> No functional changes.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

